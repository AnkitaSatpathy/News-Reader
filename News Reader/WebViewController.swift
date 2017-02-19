//
//  WebViewController.swift
//  News Reader
//
//  Created by Ankita Satpathy on 09/02/17.
//  Copyright © 2017 Ankita Satpathy. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    var url : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webview.loadRequest(URLRequest(url: URL(string: url)!))    }

  
}
