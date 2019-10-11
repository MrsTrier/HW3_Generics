//
//  Box.swift
//  PersistentStorage
//
//  Created by Roman Cheremin on 11/10/2019.
//  Copyright © 2019 Roman Cheremin. All rights reserved.
//

import Foundation

enum searchingError: Error {
    case canNotFind(String)
    case anotherVarType(String)
    var localizedDescription: String {
        return "CustomError"
    }
}

extension searchingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .canNotFind(let elem):
            return "I can not found element with key: \(elem). Try other key!"
        case .anotherVarType(let elem):
            return "It seamse like element with key: \(elem) has another type. Try again!"
        }
    }
}

class Box {
    
    weak var defaults = UserDefaults.standard
    
    func put<T>(this elem: T, withKey key: String) {
        defaults?.set(elem, forKey: key)
    }
    
    func give<T>(key: String) -> Result <T, Error> {
        var result: Optional<Any>
        
        result = defaults?.object(forKey: key)
        if let result = result as? T {
            return .success(result)
        }
        else if result != nil {
            print("Error:\n" + (searchingError.anotherVarType(key).errorDescription ?? "error"))
            return .failure(searchingError.anotherVarType(key))
        }
        else {
            print("Error:\n" + (searchingError.canNotFind(key).errorDescription ?? "error"))
            return .failure(searchingError.canNotFind(key))
        }
    }
}
