//
//  ViewController.swift
//  Web Service Example
//
//  Created by Aanya Jhaveri on 7/31/17.
//  Copyright © 2017 Aanya Jhaveri. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var forecastLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = AFHTTPSessionManager()
        manager.get("http://api.openweathermap.org/data/2.5/forecast/daily?q=Chicago&mode=json&units=metric&cnt=1&appid=c51b743bface06830ba461e8597a0702",
                    parameters: nil,
                    progress: nil,
                    success: {(operation: URLSessionDataTask, responseObject: Any?) in
                        let json = JSON(responseObject)
                        if let forecast = json["list"][0]["weather"][0]["description"].string {
                            self.forecastLabel.text = forecast }
                        if let temperature = json["list"][0]["temp"]["day"].float {
                            let farenheit = temperature * (9/5) + 32
                            if farenheit > 50 {
                                self.view.backgroundColor = UIColor.red
                            } else if farenheit <= 50 {
                                self.view.backgroundColor = UIColor.blue
                            }
                        }
                        if let city = json["city"]["name"].string {
                            self.cityLabel.text = city
                        }
        })      { (operation:URLSessionDataTask?, error:Error) in
                        print("Error: " + error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//QUESTION: I installed using Carthage and the Cartfile. But it wasn't recognizing JSON? 
//TO DO: Use JSON to display which city you are looking at (maybe drop down menu????)
