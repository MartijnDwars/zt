//
//  ViewController.swift
//  zt
//
//  Created by Martijn Dwars on 02/04/16.
//  Copyright © 2016 Martijn Dwars. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class ViewController: UIViewController {

    var pico: Pico = Pico()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func connectTapped(sender: AnyObject) {
        print("Connect button tapped!")
        
        pico.connect()
    }
    
    @IBAction func sendTapped(sender: AnyObject) {
        print("Send button tapped!")
        
        pico.send()
    }

}

