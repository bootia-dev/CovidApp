//
//  GlobalApiProtocol.swift
//  CovidApp
//
//  Created by Diego Varangot on 24/4/21.
//

import Foundation
import Alamofire

protocol GlobalApiClientProtocol {
    ///Global count as of last update
    func latest(completion: @escaping (Result<GlobalData, ApiError>) -> Void)
    
    ///Global count on any day between 22nd January 2020 and last updated date
    func date(date: Date, completion: @escaping (Result<GlobalData, ApiError>) -> Void)
}
