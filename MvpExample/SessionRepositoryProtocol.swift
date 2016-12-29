//
//  SessionRepository.swift
//  MvpExample
//
//  Created by Grigory Rylov on 29.12.16.
//  Copyright © 2016 Grigory Rylov. All rights reserved.
//

import Foundation
protocol SessionRepositoryProtocol {
    
    func setToken(token: String)
    
    func getToken() -> String?
    
}
