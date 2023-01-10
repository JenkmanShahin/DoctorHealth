//
//  SearchViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 10.01.23.
//

import UIKit
import WebKit

class SearchViewController: UIViewController{
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // load URL
        let url = URL(string: "https://www.health.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        
        // searchbar
        searchBar.text = url.absoluteString
        searchBar.delegate = self
        // not capitalize first letters
        searchBar.autocapitalizationType = .none
        
    }
    
    @IBAction func forwardPressed(_ sender: UIButton){
        webView.goForward()
    }
    
    @IBAction func backPressed(_ sender: UIButton){
        webView.goBack()
    }
}

extension SearchViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.searchBar.text = webView.url!.absoluteString       // passed the search text when searching something
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let seachText = searchBar.text!                        // قم باعداد البحث عبر شريط البحث
        searchBar.resignFirstResponder()
        let newURL = URL(string: "https://www.\(seachText).com")!
        webView.load(URLRequest(url: newURL))
        searchBar.text = newURL.absoluteString
    }
}
