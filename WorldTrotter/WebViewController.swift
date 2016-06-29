//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Dan Patey on 6/28/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
                
        let url = NSURL(string: "https://github.com/DanPatey")!
        webView.loadRequest(NSURLRequest(URL: url))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}