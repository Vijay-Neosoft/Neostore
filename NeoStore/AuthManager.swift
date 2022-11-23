//
//  AuthManager.swift
//  NeoStore
//
//  Created by Neosoft on 15/11/22.
//

import Foundation

class AuthManager {
       
    static let shared = AuthManager()
    
    private init(){}
    
    private enum AuthKeys : String {
           case user = "User"
           
       }
    
    var user : IncomingData? {
            get {
                var mappedModel = IncomingData()
                guard let data = UserDefaults.standard.value(forKey: AuthKeys.user.rawValue) else {
                   return mappedModel
                }
                let decoder = JSONDecoder()
                do {
                    mappedModel =  try! decoder.decode(IncomingData.self, from: data as! Data)
                }
                return mappedModel
            }
            set {
                if let value = newValue {
                   let encoder = JSONEncoder()
                    do {
                     UserDefaults.standard.set(try? encoder.encode(value), forKey: AuthKeys.user.rawValue)
                    }
                }else {
                    UserDefaults.standard.removeObject(forKey: AuthKeys.user.rawValue)
                }
            }
        }
}


