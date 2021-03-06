//
//  UserService.swift
//  MvpExample
//
//  Created by Grigory Rylov on 30.11.16.
//  Copyright © 2016 Grigory Rylov. All rights reserved.
//

import Foundation

class AuthService: RequesetHelper, AuthServiceProtocol{
    
    init(sessionRepository: SessionRepositoryProtocol) {
        super.init(url: "http://192.168.2.204:8001", sessionRepo: sessionRepository)
    }
    
    // Авторизация
    func auth(login: String, password: String, callback:@escaping (AuthResponse) -> Void ){
        //настройка параметров запроса
        let postString = "login=\(login)&password=\(password)";
        self.makePostRequest(method: "auth", params: postString) {
            (response: NSDictionary?) in
            // worker thread
            let authResponse = AuthResponse(json: response)
            if let token = authResponse?.data{
                self.sessionRepository.setToken(token: token)
            }
            
            OperationQueue.main.addOperation{
                // result in main thread
                callback(authResponse!)
            }
        }
    }
    
}
