//
//  ArticleViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 30.01.23.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {
    
    
    @IBOutlet weak var webView: WKWebView!
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stringURL = article?.url ?? "https://www.google.com"
        guard let url = URL(string: stringURL) else {return}
        DispatchQueue.main.async {
            self.webView.load(URLRequest(url: url))
        }

    }

}
