//
//  NetworkLogger.swift
//  CovidApp
//
//  Created by Diego Varangot on 24/4/21.
//

import Alamofire

class ApiLogger: EventMonitor {
  let queue = DispatchQueue(label: "com.bootia.covidapp.apilogger")

  func requestDidFinish(_ request: Request) {
    print(request.description)
  }

  func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
    guard let data = response.data else {
      return
    }
    if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
      print(json)
    }
  }
}
