//
//  ViewController.swift
//  WebView01
//
//  Created by D7702_09 on 2019. 9. 10..
//  Copyright © 2019년 csd5766. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var btnRefresh: UIBarButtonItem!
    @IBOutlet weak var btnForward: UIBarButtonItem!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        searchbar.delegate = self
        webView.navigationDelegate = self
        indicator.isHidden = true
        
        let request = URLRequest(url: URL(string: "https://www.google.com")!)
        webView.load(request)
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request = URLRequest(url: URL(string: searchbar.text!)!)
        webView.load(request)
        self.view.endEditing(true)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        btnBack.isEnabled = webView.canGoBack
        btnForward.isEnabled = webView.canGoForward
        
        indicator.stopAnimating()
        indicator.isHidden = true
        searchbar.text = webView.url?.absoluteString
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func refresh(_ sender: Any) {
        webView.reload()
    }
    
    @IBAction func forward(_ sender: Any) {
        webView.goForward()
    }
    


}

