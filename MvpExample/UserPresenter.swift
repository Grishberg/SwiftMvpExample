//
//  UserPresenter.swift
//  MvpExample
//
//  Created by Grigory Rylov on 30.11.16.
//  Copyright © 2016 Grigory Rylov. All rights reserved.
//

import Foundation
class UserPresenter{
    private var view: UserView?
    let service: UserServiceProtocol
    
    init(userService:UserServiceProtocol){
        self.service = userService
    }
    
    func attachView(view:UserView){
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
        
        service.auth(login: "123456789", password: "12345", callback:{ [weak self] success in
            if self != nil && self!.view != nil {
                self!.view!.hideProgress()
            }
        })
    }
    
    private func getUsers(){
        self.view?.showProgress()
        
        service.getUsers{ [weak self] users in
            if self != nil && self!.view != nil {
                self!.view!.hideProgress()
                let mappedUsers = users.map{
                    return UserViewData(name: "\($0.name)")
                }
                self!.view!.showUser(user: mappedUsers)
            }
        }
    }
}
