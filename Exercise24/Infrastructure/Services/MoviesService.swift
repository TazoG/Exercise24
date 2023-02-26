//
//  MoviesService.swift
//  Exercise24
//
//  Created by Mariam Joglidze on 26.02.23.
//

import Foundation
class MoviesService {
    private let webServiceManager: WebServiceManagerProtocol
    
    init(webServiceManager: WebServiceManagerProtocol) {
        self.webServiceManager = webServiceManager
    }
    
    
    func fetchMovies(_ completion: @escaping (([MovieResults]) -> Void)) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=44eb1481b98d9c5e2d312757977b5c5a") else {
            return
        }
        webServiceManager.httpGet(url: url) { (result: Result<MovieResponse, Error>) in
            switch result {
            case let .success(response):
                completion(response.results)
            case let .failure(error):
                print(error)
            }
        }
    }
    
}
