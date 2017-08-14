//
//  ViewController.swift
//  get_test
//
//  Created by raghavendra karkera on 8/14/17.
//  Copyright © 2017 university of maryland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func get(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, responce, error) in
            if let responce = responce{
                print(responce)
            }
            if let data = data{
                print(data)
            }
            
            }.resume()
    }
    @IBAction func post(_ sender: Any) {
        let parameters = ["username":"raghav","tweet":"hello world"]
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
       guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {return}
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, responce, erroe) in
            if let responce = responce{
                print(responce)
            }
            if let data = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch{
                    print(error)
                }
            }
        }.resume()
        
        
        
    }
    
}

