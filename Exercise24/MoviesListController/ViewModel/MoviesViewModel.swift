//
//  MoviesViewModel.swift
//  Exercise24
//
//  Created by Mariam Joglidze on 26.02.23.
//

import Foundation

struct MovieViewModel {
    let id: Int
    let title: String
    let image: String
    
    init(movie: Movie) {
        id = movie.id
        title = movie.title
        image = movie.image
    }
}
