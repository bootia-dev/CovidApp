//
//  UserDefaults+CA.swift
//  Bootia
//
//  Created by Diego Varangot on 24/4/21.
//

import Foundation

extension UserDefaults {
    open func setStruct<T: Codable>(_ value: T?, forKey defaultName: String) {
        let data = try? ApiEncoder().encode(value)
        set(data, forKey: defaultName)
    }

    open func structData<T>(_ type: T.Type, forKey defaultName: String) -> T? where T: Decodable {
        guard let encodedData = data(forKey: defaultName) else {
            return nil
        }
        do {
            return try ApiDecoder().decode(type, from: encodedData)
        } catch {
            return nil
        }
    }

    open func setStructArray<T: Codable>(_ value: [T], forKey defaultName: String) {
        let data = value.map { try? ApiEncoder().encode($0) }

        set(data, forKey: defaultName)
    }

    open func structArrayData<T>(_ type: T.Type, forKey defaultName: String) -> [T] where T: Decodable {
        guard let encodedData = array(forKey: defaultName) as? [Data] else {
            return []
        }

        return encodedData.compactMap {
            do {
                return try ApiDecoder().decode(type, from: $0)
            } catch {
                return nil
            }
        }
    }
}
