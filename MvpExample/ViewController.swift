//
//  ViewController.swift
//  MvpExample
//
//  Created by Grigory Rylov on 30.11.16.
//  Copyright © 2016 Grigory Rylov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AuthView {

    let sessionRepository = SessionRepository()
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var presenter: AuthPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let service: AuthServiceProtocol = AuthService(sessionRepository: sessionRepository)
        presenter = AuthPresenter(userService: service)
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

    
    func getLogin() -> String {
        return loginTextField.text!
    }

    func getPassword() -> String{
        return passwordTextField.text!
    }
    
    // Открыть экран управления подсветкой
    func showLightScreen() {
        //Bundle.main.loadNibNamed("LightViewController", owner: self, options: nil)
        //let view = objects?[0] as! UIView
        let secondViewController:LightViewController = LightViewController(sessionRepository: sessionRepository)
        
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    func showError() {
        let alert = UIAlertController(title: "Auth error", message: "Bad login or password", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

