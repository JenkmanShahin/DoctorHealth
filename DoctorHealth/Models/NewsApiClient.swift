//
//  NewsApiClient.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 30.01.23.
//

import Foundation
import UIKit

private let baseURL = "https://newsapi.org"
private let apiKey = "08dc229d15ba46a5b6f67597a831beb4"

enum NewsApiEndpoints: String {
    case everything = "/v2/everything"
    case sources = "/v2/top-headlines/sources"
}

func buildURL(endpoint: NewsApiEndpoints, keyword: String) -> String{
    return baseURL + NewsApiEndpoints.everything.rawValue + "?q=\(keyword)&apiKey=\(apiKey)"
}
struct NewsApiClient{
    func fetchNews(complitionHandler: @escaping(News) -> Void) {
        var newURL = buildURL(endpoint: NewsApiEndpoints.everything, keyword: "Health")
        newURL = newURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        guard let url = URL(string: newURL) else {return}
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { data, response, error in
            if(data != nil && error == nil) {
                do {
                    let news = try JSONDecoder().decode(News.self, from: data!)
                    complitionHandler(news)
                } catch {
                    print("ERROR: \(error)")
                }
            }
        }
        dataTask.resume()
        
    }
  
    
    func fetchImageBy(imageURL: URL, completionHandler: @escaping(UIImage) -> Void){
        let session = URLSession.shared
        let downloadTask = session.downloadTask(with: imageURL) {data, response, error in
            if(data != nil && error == nil) {
                do {
                    let rawData = try Data(contentsOf: data!)
                    guard let image = UIImage(data: rawData) else {return}
                    completionHandler(image)
                } catch {
                    print("ERROR: \(error)")
                }
            }
        }
        downloadTask.resume()
    }
}
