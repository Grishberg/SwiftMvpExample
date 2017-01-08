//
//  LightStatusResponse.swift
//  MvpExample
//
//  Created by Grigory Rylov on 06.01.17.
//  Copyright © 2017 Grigory Rylov. All rights reserved.
//

import Foundation
struct LightStatusResponse{
    let status: Bool?
    let error: ErrorContainer?
    
    public init?(json: NSDictionary?) {
        if json == nil{
            error = ErrorContainer()
            status = nil
            return
        }
        if let errorPart = json?["error"] as? NSDictionary {
            error = ErrorContainer(json: errorPart)
            status = nil
            return
        }
        error = nil
        if let dataPart = json?["data"] as? Bool {
            status = dataPart
        } else {
            status = nil
        }
    }
}
