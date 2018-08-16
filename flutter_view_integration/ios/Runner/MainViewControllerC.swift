//
//  MainViewController.swift
//  Runner
//
//  Created by mac on 01/12/1439 AH.
//  Copyright © 1439 The Chromium Authors. All rights reserved.
//

import UIKit
import Flutter

class MainViewControllerC: UIViewController {
    var counter = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 0;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "FlutterViewControllerSegue" {
            //let vc = FlutterViewController()
            //vc.send(onChannel: "test", message: "Good".data(using: String.Encoding.utf8))
        }
    }
    

}
