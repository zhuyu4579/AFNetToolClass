//
//  ViewController.swift
//  AFNToolClass
//
//  Created by 浙大网新中研软件 on 2019/9/10.
//  Copyright © 2019 浙大网新中研软件. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        AFNetTools.shareInstance.request(methodType: .GET, urlString: "http://httpbin.org/get", parameters: ["name":"why"]) { (result, error) in
            if error != nil{
                print(error!)
                return
            }
            print(result!)
        }
    }

}

