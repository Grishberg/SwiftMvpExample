//
//  LightPresenter.swift
//  MvpExample
//
//  Created by Grigory Rylov on 06.01.17.
//  Copyright © 2017 Grigory Rylov. All rights reserved.
//

import Foundation
class LightPresenter{
    private var view: LightView?
    private let service: LightServiceProtocol

    init(lightService: LightServiceProtocol){
        service = lightService
    }
    
    func attachView(view: LightView){
        self.view = view
        service.requestLightStatus {
            (status: LightStatusResponse) in
            if status.status != nil {
                view.showLightState(enabled: status.status!)
            }
        }
    }
    
    func detachView(){
        self.view = nil
    }
    
    func turnOnLight(){

    }
    
    func turnOffLight(){
        
    }
}
