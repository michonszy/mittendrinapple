//
//  PlayMittendrinViewController.swift
//  mittendrin
//
//  Created by Szymon on 13.07.2018.
//  Copyright © 2018 Szymon. All rights reserved.
//

import UIKit
import WebKit
class PlayMittendrinViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var backButton: UIButton!
   
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var newsWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        activity.center = view.center
        // Do any additional setup after loading the view.
        loadWebsite()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
         
    }
    
    func loadWebsite(){
        
        guard let url = URL(string: "https://mittendrin.pl/radio-mittendrin.php") else { return }
        newsWebView = WKWebView(frame: self.view.frame)
        newsWebView.translatesAutoresizingMaskIntoConstraints = false
        newsWebView.isUserInteractionEnabled = true
        newsWebView.navigationDelegate = self
        self.view.addSubview(self.newsWebView)
        let request = URLRequest(url: url)
        newsWebView.load(request)
        
        // add activity
        self.newsWebView.addSubview(self.activity)
        self.activity.startAnimating()
        self.newsWebView.navigationDelegate = self
        self.activity.hidesWhenStopped = true
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activity.stopAnimating()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
