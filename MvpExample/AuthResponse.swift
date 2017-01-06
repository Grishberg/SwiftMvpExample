//
//  Response.swift
//  MvpExample
//
//  Created by Grigory Rylov on 05.01.17.
//  Copyright © 2017 Grigory Rylov. All rights reserved.
//

import Foundation

struct AuthResponse {
    let error: ErrorContainer?
    let data: String?
    public init?(json: NSDictionary?) {
        if json == nil{
            error = ErrorContainer()
            data = nil
            return
        }
        if let errorPart = json?["error"] as? NSDictionary {
            error = ErrorContainer(json: errorPart)
            data = nil
            return
        }
        error = nil
        if let dataPart = json?["data"] as? String {
            data = dataPart
        } else {
            data = nil
        }
    }
}
