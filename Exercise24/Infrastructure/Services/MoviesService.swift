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
    
    func fetchMovies(url: String, completion: @escaping ((Response) -> Void)) {
        webServiceManager.get(url: url) { (result: Result<Response, WebServiceManager.WebServiceError>) in
            switch result {
            case let .success(Response):
                completion(Response)
            case let .failure(error):
                print(error)
            }
        }
    }

    
    
}


