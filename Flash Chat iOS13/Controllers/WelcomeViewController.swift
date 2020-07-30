//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {


    @IBOutlet weak var titleLabel:CLTypingLabel! // see here i use third party CLtyping library
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
//        titleLabel.text = " "
//        let titleText = k.appName
//        var place = 0.0
//        for latter in titleText
//        {
//            Timer.scheduledTimer(withTimeInterval: 0.1 * place, repeats: false) { (Timer) in
//                self.titleLabel.text?.append(latter)
//
//            }
//             place += 1
//        }

       
        titleLabel.text = K.appName
        
    }
    

}
