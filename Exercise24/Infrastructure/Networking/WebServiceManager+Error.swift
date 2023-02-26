//
//  WebServiceManager+Error.swift
//  Exercise24
//
//  Created by Mariam Joglidze on 26.02.23.
//

import Foundation

extension WebServiceManager {
    enum WebServiceError: Error {
        case dataIsMissing
        case incorrectUrl
        case networkError(Error)
        case parsingError(Error)
    }
}
