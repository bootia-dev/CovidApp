//
//  GlobalRouter.swift
//  CovidApp
//
//  Created by Diego Varangot on 24/4/21.
//

import Alamofire

enum GlobalRouter: URLRequestBuilder {

    case latest(Parameters?), date(Date), range(Date, Date), timeseries(Date, Date), count
            
    var basePath: String {
        return "\(K.JHApi.host)/\(K.JHApi.Paths.root)/\(K.JHApi.Paths.version)"
    }

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        let auxPath = "/\(K.JHApi.Paths.global)"
        switch self {
        case .date(let date): return "\(auxPath)/\(date.prettyToString())"
        case .range(let fromDate, let toDate): return "\(auxPath)/\(fromDate.prettyToString())/\(toDate.prettyToString())"
        case .timeseries(let fromDate, let toDate): return "\(auxPath)/timeseries/\(fromDate.prettyToString())/\(toDate.prettyToString())"
        case .count: return "\(auxPath)/count"
        default: return auxPath
        }
    }

    var body: Parameters? {
        return nil
    }

    var query: Parameters? {
        return nil
    }
}
