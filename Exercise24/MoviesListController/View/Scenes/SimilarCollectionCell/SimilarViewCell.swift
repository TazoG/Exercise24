//
//  SimilarViewCell.swift
//  Exercise24
//
//  Created by Tazo Gigitashvili on 26.02.23.
//

import UIKit

class SimilarMovieCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var favouriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImageView.contentMode = .scaleToFill
        cellImageView.layer.cornerRadius = 20
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
                        self.cellImageView.image = image
                    }
                }
            }
            task.resume()
        }
    }

    
    
    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
        print("Favourited")
    }
    
}
