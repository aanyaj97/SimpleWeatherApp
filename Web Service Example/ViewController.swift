//
//  ViewController.swift
//  Web Service Example
//
//  Created by Aanya Jhaveri on 7/31/17.
//  Copyright © 2017 Aanya Jhaveri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forecastLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = AFHTTPSessionManager()
        manager.get("http://api.openweathermap.org/data/2.5/forecast/daily?q=London&mode=json&units=metric&cnt=1&appid=c51b743bface06830ba461e8597a0702",
                    parameters: nil,
                    progress: nil,
                    success: {(operation: URLSessionDataTask, responseObject: Any?) in
                        if let responseObject = responseObject {
                            print("Response: " + (responseObject as AnyObject).description)
                        }
        }) {(operation:URLSessionDataTask?, error: Error) in
            print("Error: " + error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


