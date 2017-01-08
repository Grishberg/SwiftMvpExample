//
//  Error.swift
//  MvpExample
//
//  Created by Grigory Rylov on 05.01.17.
//  Copyright © 2017 Grigory Rylov. All rights reserved.
//

import Foundation
struct ErrorContainer {
    let code: Int
    let message: String
    init(json: NSDictionary?) {
        if let codePart = json?["code"] as? Int {
            code = codePart
        } else {
            code = -1
        }
        if let messagePart = json?["message"] as? String {
            message = messagePart
        } else {
            message = ""
        }
    }
    
    init (){
        code = -1
        message = ""
    }
}
