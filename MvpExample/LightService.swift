//
//  LightService.swift
//  MvpExample
//
//  Created by Grigory Rylov on 06.01.17.
//  Copyright © 2017 Grigory Rylov. All rights reserved.
//

import Foundation
class LightService: RequesetHelper, LightServiceProtocol{
   
    // загрузка статуса подсветки
    func requestLightStatus(callback:@escaping (LightStatusResponse) -> Void ){
        //настройка параметров запроса
        let postString = "token=\(self.sessionRepository.getToken())";
        self.makeGetRequest(method: "light", params: postString) {
            (response: NSDictionary?) in
            // worker thread
            let lightStatusResponse = LightStatusResponse(json: response)
            
            OperationQueue.main.addOperation{
                // result in main thread
                callback(lightStatusResponse!)
            }
        }

    }

    
    func changeLightStatus(newStatus: Bool, callback:@escaping (LightStatusResponse) -> Void ){
        
    }

}
