//
//  MoviesListViewModel.swift
//  Exercise24
//
//  Created by Mariam Joglidze on 26.02.23.
//

import Foundation
final  class MoviesListViewModel {

    private var moviesService: MoviesService
    
    var onReceivedMovies: (([MovieViewModel]) -> Void)?
    var didSelectRowAt: ((MovieViewModel)-> Void)?
    
    init (
        moviesService: MoviesService
    ) {
        self.moviesService = moviesService
    }
    
    
    func fetchMovies() {
        moviesService.fetchMovies() { movies in
            DispatchQueue.main.async {
                
                self.onReceivedMovies?(movies.results.map(MovieViewModel.init))
            }
        }
    }



}
