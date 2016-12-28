//
//  ViewController.swift
//  MvpExample
//
//  Created by Grigory Rylov on 30.11.16.
//  Copyright © 2016 Grigory Rylov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UserView {

    var presenter: UserPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let service: UserServiceProtocol = UserService()
        presenter = UserPresenter(userService: service)
        presenter!.attachView(view: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        if presenter != nil {
            presenter!.detachView()
        }
        // Dispose of any resources that can be recreated.
    }

    @IBAction func downloadButtonClicked(_ sender: Any) {
        presenter!.onDownloadClicked()
    }
    
    func showProgress() {
        print("show prgogress")
    }
    
    func hideProgress() {
        print("hide progress")
    }

    func showUser(user: [UserViewData]){
        print("show users \(user)")
    }

}

