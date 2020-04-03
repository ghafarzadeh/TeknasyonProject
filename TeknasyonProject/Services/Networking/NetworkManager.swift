//
//  NetworkManager.swift
//  TeknasyonProject
//
//  Created by Nuevo Appledort on 31.03.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

typealias Headers = [String: String]
typealias Parameters = [String : Any]

protocol RequestManagerProtocol {
    func rxget<T:Modelable>(url: String) -> Observable<(T?, RequestManager.RequestError?)>
}

final class RequestManager: RequestManagerProtocol {
    enum HTTPMethod: String {
        case get     = "GET"
        case post    = "POST"
        case put     = "PUT"
        case delete  = "DELETE"
        case patch   = "PATCH"
    }
    enum RequestError: Error {
        case unknownError
        case connectionError
        case authorizationError
        case invalidRequest
        case notFound
        case invalidResponse
        case serverError
        case serverUnavailable
    }

    static let shared = RequestManager()
    private let backgroundWorkScheduler: OperationQueueScheduler
    private var headers: Headers? = nil
    private init() {
        URLSession.shared.configuration.timeoutIntervalForResource = 30
        URLSession.shared.configuration.timeoutIntervalForRequest = 30
        
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 2
        operationQueue.qualityOfService = QualityOfService.userInitiated
        backgroundWorkScheduler = OperationQueueScheduler(operationQueue: operationQueue)
    }
    
    func rxget<T: Modelable>(url: String) -> Observable<(T?, RequestError?)> {
        var urlRequest = URLRequest(url: URL(string: EndPoints.baseUrl.path + url)!,
                                    cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 25)
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        httpLogger(url: url, parameters: nil, headers: urlRequest.allHTTPHeaderFields)
        return URLSession.shared.rx.response(request: urlRequest)
                .observeOn(backgroundWorkScheduler)
                .map { pair in
                    switch pair.response.statusCode {
                    case 200...300:
                        let decodedData = T(data: pair.data)
                        return (decodedData, nil)
                    case 400...499:
                        return(nil, RequestError.authorizationError)
                    case 500...599:
                        return(nil, RequestError.serverError)
                    default:
                        return(nil, RequestError.unknownError)
                }
        }
    }
    
    
    private func httpLogger(url:String, parameters:[String:String]?,headers: [String:String]?) {
        print("\n__________________________________________________________________________")
        print ( "request name : " + url + "\nParams : ")
        print(parameters ?? "no params")
        print("\nheaders : ")
        print (headers ?? "no headers" )
        print("__________________________________________________________________________")
    }

}
