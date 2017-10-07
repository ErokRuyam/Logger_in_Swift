//
//  ViewController.swift
//  Logging
//
//  Created by Mayur on 05/10/17.
//  Copyright © 2017 Mayur. All rights reserved.
//

import UIKit
import Logger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let logConfig = LogConfiguration.init(logDirectory: nil, logFilename: "MyAppLogs", logMessageDateFormat: "yyyy-MM-dd hh:mm:ss a", logLevel: Log.Level.debug, logFileSize: nil, logFileRotateCount: 10)
        Log.sharedInstance.initializeWithConfiguration(logConfig)
        
        
        Log.sharedInstance.logInfo(#file, message: "Info")
        Log.sharedInstance.logDebug(#file, message: "Debug")
        Log.sharedInstance.logWarning(#file, message: "Warning")
        Log.sharedInstance.logError(#file, message: "Error")
        Log.sharedInstance.logFunction(#function)

        if Log.sharedInstance.appDidCrashLastTime() {
            Log.sharedInstance.logInfo(#file, message: "Do handle the crash logs.")
            Log.sharedInstance.clearCrashFlag()
        }
        
        let logDir = Log.sharedInstance.getLogDirectory()
        Log.sharedInstance.logInfo(#file, message: "\(logDir)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

