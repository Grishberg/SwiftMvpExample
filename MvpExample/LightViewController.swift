//
//  LightViewController.swift
//  MvpExample
//
//  Created by Grigory Rylov on 06.01.17.
//  Copyright © 2017 Grigory Rylov. All rights reserved.
//

import UIKit

class LightViewController: UIViewController, LightView {
    let presenter: LightPresenter!
    
    @IBOutlet weak var lightSwitch: UISwitch!
    
    init(sessionRepository: SessionRepository) {
        let lightService = LightService(url: "http://192.168.2.204:8001", sessionRepo: sessionRepository)
        self.presenter = LightPresenter(lightService: lightService)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.presenter = nil
        super.init(coder: aDecoder)
    }
    
    @IBAction func onSwitchValueChanged(_ sender: Any) {
        if lightSwitch.isOn {
            presenter.turnOnLight()
        } else {
            presenter.turnOffLight()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.presenter.attachView(view: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showLightState(enabled: Bool){
        lightSwitch.setOn(enabled, animated: true)
    }

}
