//
//  UserServiceProtocol.swift
//  MvpExample
//
//  Created by Grigory Rylov on 30.11.16.
//  Copyright © 2016 Grigory Rylov. All rights reserved.
//

import Foundation
protocol UserServiceProtocol {
    
    func getUsers(callback:@escaping ([User]) -> Void )
    
    func requestLightStatus(callback:@escaping (Bool) -> Void )
    
    func auth(login: String, password: String, callback:@escaping (Bool) -> Void )
}
