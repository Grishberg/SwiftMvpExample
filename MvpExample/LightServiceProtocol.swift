//
//  LightServiceProtocol.swift
//  MvpExample
//
//  Created by Grigory Rylov on 06.01.17.
//  Copyright © 2017 Grigory Rylov. All rights reserved.
//

import Foundation
protocol LightServiceProtocol {
    func requestLightStatus(callback:@escaping (LightStatusResponse) -> Void )
    
    func changeLightStatus(newStatus: Bool, callback:@escaping (LightStatusResponse) -> Void )
}
