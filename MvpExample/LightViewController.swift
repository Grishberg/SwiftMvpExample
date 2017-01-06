//
//  LightViewController.swift
//  MvpExample
//
//  Created by Grigory Rylov on 06.01.17.
//  Copyright © 2017 Grigory Rylov. All rights reserved.
//

import UIKit

class LightViewController: UIViewController, LightView {
    let sessionRepository:SessionRepository!
    
    
    init(sessionRepository: SessionRepository) {
        self.sessionRepository = sessionRepository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.sessionRepository = nil
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
