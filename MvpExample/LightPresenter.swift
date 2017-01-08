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
        service.requestLightStatus(callback: processLighStatus)
    }
    
    func detachView(){
        self.view = nil
    }
    
    func turnOnLight(){
        self.changeLightState(newState: true)
    }
    
    func turnOffLight(){
        self.changeLightState(newState: false)
    }
    
    private func changeLightState(newState: Bool){
        service.changeLightStatus(newStatus: newState, callback: processLighStatus)
    }

    private func processLighStatus(status: LightStatusResponse){
        if self.view == nil {
            print("**** processLighStatus: view is nil")
            return
        }
        if status.status != nil {
            print("**** light state is \(status.status!)")
            view!.showLightState(enabled: status.status!)
        } else if let error = status.error {
            view!.showLightState(enabled: false)
            self.processError(error: error)
        }
    }
    
    private func processError(error: ErrorContainer){
        print("**** process error response")
        //TODO: replace with constants
        if error.code == 1002 {
            self.view!.showAuthError()
        }
    }
}
