//
//  ViewController.swift
//  CheekiTools2
//
//  Created by Aiden Bradley Albert on 11/27/17.
//  Copyright (c) 2017 Aiden Bradley Albert. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
class TvOsBeta: UIViewController {
    @IBAction func install(sender: AnyObject) {
        var url: NSURL
        url=NSURL(string: "https://cdn.discordapp.com/attachments/356133677085753347/359766221274480642/tvOS_11_beta_Profile.mobileconfig")!
        UIApplication.sharedApplication().openURL(url)
    }
    
}

class APNonce: UIViewController {
    @IBOutlet weak var rootpwd: UITextField!
    
    @IBOutlet weak var noncetext: UITextField!
    var variableString = "nvram com.apple.System.boot-nonce="
    
    @IBAction func setnonce(sender: AnyObject) {
        variableString += noncetext.text
        system(variableString)
    }
}

class JBChecker: UIViewController {
    var isDir2 : ObjCBool = true
    var fileManager = NSFileManager()
    var tmpDir = NSTemporaryDirectory()
   
    var isDir : ObjCBool = true
    @IBOutlet weak var jbstatus: UILabel!
    override func viewDidLoad() {
                    if fileManager.fileExistsAtPath("/Applications/SpringBoard.app/", isDirectory:&isDir) {
                NSLog("filemansuccess")
                jbstatus.text = "Root Files can be read from a sandboxed app"
                
            } else {
                jbstatus.text = "Root Files can NOT be read from a sandboxed app"
            }
        
    }
    }
