//
//  UserView.swift
//  MvpExample
//
//  Created by Grigory Rylov on 30.11.16.
//  Copyright © 2016 Grigory Rylov. All rights reserved.
//

import Foundation

protocol AuthView: ErrorViewProtocol {
    
    // Отображение прогресса
    func showProgress()

    // Скрытие прогресса
    func hideProgress()
    
    // возвращение логина
    func getLogin() -> String
    
    // возвращение пароля
    func getPassword() -> String
    
    // переход на экран управления подсветкой
    func showLightScreen()
}
