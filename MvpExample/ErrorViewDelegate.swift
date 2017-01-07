//
//  ErrorViewDelegate.swift
//  MvpExample
//
//  Created by Grigory Rylov on 07.01.17.
//  Copyright © 2017 Grigory Rylov. All rights reserved.
//
// Вспомогательный класс для отображения ошибки

import UIKit
class ErrorViewDelegate: ErrorViewProtocol{
    let parentView: UIViewController
    
    init(view: UIViewController){
        parentView = view
    }
    
    func showAuthError() {
        let alert = UIAlertController(title: "Auth error", message: "Bad login or password", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        parentView.present(alert, animated: true, completion: nil)
    }
}
