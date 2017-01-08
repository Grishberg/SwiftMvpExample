//
//  SessionRepository.swift
//  MvpExample
//
//  Created by Grigory Rylov on 29.12.16.
//  Copyright © 2016 Grigory Rylov. All rights reserved.
//
// Хранилище для токена

import Foundation
class SessionRepository: SessionRepositoryProtocol{
    var currentToken: String?
    
    func setToken(token: String){
        currentToken = token
    }
    
    func getToken() -> String?{
        return currentToken
    }
}
