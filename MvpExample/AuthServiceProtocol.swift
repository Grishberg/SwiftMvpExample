//
//  UserServiceProtocol.swift
//  MvpExample
//
//  Created by Grigory Rylov on 30.11.16.
//  Copyright © 2016 Grigory Rylov. All rights reserved.
//

import Foundation
protocol AuthServiceProtocol {
    
    func auth(login: String, password: String, callback:@escaping (AuthResponse) -> Void )
}
