//
//  MoviesListViewModel.swift
//  Exercise24
//
//  Created by Mariam Joglidze on 26.02.23.
//

import Foundation

final  class MoviesListViewModel {
    
    private let url = "https://api.themoviedb.org/3/movie/popular?api_key=44eb1481b98d9c5e2d312757977b5c5a"
    private let moviesService: MoviesService
    
    var onReceivedMovies: (([MovieViewModel]) -> Void)?
    var didSelectRowAt: ((MovieViewModel)-> Void)?
    
    init (
        moviesService: MoviesService
    ) {
        self.moviesService = moviesService
    }
    
    
    func fetchMovies() {
        moviesService.fetchMovies(url: url) { movies in
            DispatchQueue.main.async {
                
                self.onReceivedMovies?(movies.results.map(MovieViewModel.init))
            }
        }
    }



}
