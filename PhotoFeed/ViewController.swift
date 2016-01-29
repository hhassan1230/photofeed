//
//  ViewController.swift
//  PhotoFeed
//
//  Created by Hessvacio Hassan on 1/28/16.
//  Copyright © 2016 Hessvacio Hassan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    
    @IBAction func nextButtonAction(){
        print("nextButtonAction: \(self.nameField.text!)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("prepareForSegue")
        
        let photoListVc = segue.destinationViewController as! PhotoListViewController
        photoListVc.instagramName = self.nameField.text
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

