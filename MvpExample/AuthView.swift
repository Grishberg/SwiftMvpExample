//
//  UserView.swift
//  MvpExample
//
//  Created by Grigory Rylov on 30.11.16.
//  Copyright © 2016 Grigory Rylov. All rights reserved.
//

import Foundation

protocol AuthView: ErrorViewProtocol {
    func showProgress()
    func hideProgress()
    func getLogin() -> String
    func getPassword() -> String
    func showLightScreen()
}
