//
//  NetworkInterceptor.swift
//  CovidApp
//
//  Created by Diego Varangot on 24/4/21.
//

import Alamofire

class ApiRequestInterceptor: RequestInterceptor {

    let retryLimit = K.JHApi.retries
    let retryDelay: TimeInterval = K.JHApi.retryDelay

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        if let token = App.shared.token {
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: K.JHApi.Keys.Headers.authentication)
        }

        completion(.success(urlRequest))
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        let response = request.task?.response as? HTTPURLResponse
      
        //Retry for 5xx status codes
        if let statusCode = response?.statusCode, (500...599).contains(statusCode), request.retryCount < retryLimit {
            completion(.retryWithDelay(retryDelay))
        } else {
            completion(.doNotRetry)
        }
    }
}
