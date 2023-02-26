//
//  DetailViewController.swift
//  Exercise24
//
//  Created by Tazo Gigitashvili on 26.02.23.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movie: Movie! = Movie(id: 50, image: "", title: "title")
    var similarMovies = [Movie]()
    let webServiceManager: WebServiceManagerProtocol = WebServiceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "SimilarMovieCell", bundle: nil), forCellWithReuseIdentifier: "SimilarMovieCell")

        
        titleLabel.text = movie.title
        configure(with: movie)
        fetchSimilarMovies()
          
    }
    
    func fetchSimilarMovies() {
        webServiceManager.get(url: movie.similarMoviesURL) { [weak self] (result: Result<Response, WebServiceManager.WebServiceError>) in
                switch result {
                case let .success(response):
                    self?.similarMovies = response.results
                    DispatchQueue.main.async {
                        self?.collectionView.reloadData()
                    }
                case let .failure(error):
                    print("Failed to fetch similar movies: \(error.localizedDescription)")
                }
            }
        }
    
    func configure(with movie: Movie) {
        
        if let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(movie.image)") {
            let task = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                if let error = error {
                    print("Error loading movie image: \(error)")
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }
            task.resume()
        }
    }
}

extension DetailVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        similarMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimilarMovieCell", for: indexPath) as! SimilarMovieCell
        let movie = similarMovies[indexPath.item]
        cell.configure(with: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 180)
    }
    
    
    
    
    
}
