//
//  UserPresenter.swift
//  MvpExample
//
//  Created by Grigory Rylov on 30.11.16.
//  Copyright © 2016 Grigory Rylov. All rights reserved.
//
// Презентер для управления авторизацией

import Foundation
class AuthPresenter{
    private var view: AuthView?
    let service: AuthServiceProtocol
    
    init(userService:AuthServiceProtocol){
        self.service = userService
    }
    
    func attachView(view:AuthView){
        print("view attached")
        self.view = view
    }
    
    func detachView() {
        print("view detached")
        self.view = nil
    }
    
    func onDownloadClicked(){
        print("onDownloadCkicked")
        self.view!.showProgress()
        
        service.auth(login: view!.getLogin(), password: view!.getPassword(), callback:{ [weak self] authResponse in
            if self != nil && self!.view != nil {
                self!.view!.hideProgress()
                
                if let error = authResponse.error {
                    self!.processError(error: error)
                } else {
                    self!.view?.showLightScreen()
                }
            }
        })
    }
    
    private func processError(error: ErrorContainer){
        if error.code == 1002 {
            view!.showAuthError()
        }
    }
    
}
