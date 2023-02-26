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
    
    func fetchMovies(completion: @escaping ((Response) -> Void)) {
        webServiceManager.get(url: "https://api.themoviedb.org/3/movie/popular?api_key=44eb1481b98d9c5e2d312757977b5c5a") { (result: Result<Response, WebServiceManager.WebServiceError>) in
            switch result {
            case let .success(Response):
                completion(Response)
            case let .failure(error):
                print(error)
            }
        }
    }

    
    
}


