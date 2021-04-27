//
//  K+Network.swift
//  CovidApp
//
//  Created by Diego Varangot on 24/4/21.
//

import Foundation

extension K {
    struct JHApi {
        static let host = "https://covidapi.info"
        
        struct Keys {
            struct Body {
                
            }

            struct Headers {
                static let authentication: String = "authentication"
            }

            struct Query {

            }
        }

        static let timeout = 60
        static let retries = 2
        static let retryDelay: TimeInterval = 10
        
        struct Paths {
            static let root = "api"
            static let version = "v1"
            static let global = "global"
        }
        
    }
}
