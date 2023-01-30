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
    case headlines = "/v2/top-headlines"
    case sources = "/v2/top-headlines/sources"
}

struct NewsApiClient{
    func fetchNews(){
        // access NewsApiEndpoints.everything
        
    }
    
    func fetchHeadlines(){
        // access NewsApiEndpoints.headlines
        
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
