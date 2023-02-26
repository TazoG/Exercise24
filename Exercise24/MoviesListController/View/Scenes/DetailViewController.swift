//
//  DetailViewController.swift
//  Exercise24
//
//  Created by Tazo Gigitashvili on 26.02.23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let moviesService: MoviesService
    var movie: MovieViewModel!
    var similarMovies = [MovieViewModel]()
    let webServiceManager: WebServiceManagerProtocol = WebServiceManager()
    private var url: String {
        get {
            return "https://api.themoviedb.org/3/movie/\(movie.id)/similar?api_key=44eb1481b98d9c5e2d312757977b5c5a"
        }
    }
    
    
    init (moviesService: MoviesService) {
        self.moviesService = moviesService
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "SimilarMovieCell", bundle: nil), forCellWithReuseIdentifier: "SimilarMovieCell")
        
        
        titleLabel.text = movie.title
        configure(with: movie)
            
    }
    
//    func fetchMovies() {
//        moviesService.fetchMovies(url: url) { result in
//            self.similarMovies = result.results.map([MovieViewModel.init])
//        }
//    }
    
    func configure(with movie: MovieViewModel) {
        if let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(movie.image)") {
            let task = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                if let error = error {
                    print("Error loading movie image: \(error)")
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.detailImageView.image = image
                    }
                }
            }
            task.resume()
            
        }
        
        
    }
    
}




extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
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
