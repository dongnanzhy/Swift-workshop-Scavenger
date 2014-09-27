//
//  ViewController.swift
//  Scavenger
//
//  Created by Xinyun (Victor) Zhao on 9/23/14.
//  Copyright (c) 2014 Xinyun (Victor) Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var createdItem: ScavengerHuntItem?
    //var itemName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBOutlet weak var textbox: UITextField!
    
    override func prepareForSegue(seque: UIStoryboardSegue, sender: AnyObject?) {
        if seque.identifier == "DoneItem"{
            if let name = textbox.text{
                if !name.isEmpty {
                    createdItem = ScavengerHuntItem(name:name);
    
                }
            }
        }
    }
    
}

