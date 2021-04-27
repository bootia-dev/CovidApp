//
//  GlobalClient.swift
//  CovidApp
//
//  Created by Diego Varangot on 24/4/21.
//

import Alamofire

struct GlobalClient: GlobalApiClientProtocol {
    func latest(completion: @escaping (Result<GlobalData, ApiError>) -> Void) {
        ApiClient.shared.request(GlobalRouter.latest(nil)) { (result: Result<GlobalData, ApiError>) in
            switch result {
            case .success(let response):
                completion(.success((response)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func date(date: Date, completion: @escaping (Result<GlobalData, ApiError>) -> Void) {
        ApiClient.shared.request(GlobalRouter.date(date)) { (result: Result<GlobalData, ApiError>) in
            switch result {
            case .success(let response):
                completion(.success((response)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func range(fromDate: Date, toDate: Date, completion: @escaping (Result<GlobalData, ApiError>) -> Void) {
        ApiClient.shared.request(GlobalRouter.timeseries(fromDate, toDate)) { (result: Result<GlobalData, ApiError>) in
            switch result {
            case .success(let response):
                completion(.success((response)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
