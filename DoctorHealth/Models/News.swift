//
//  News.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 30.01.23.
//

import Foundation

struct News: Codable{
    var status: String
    var totalResults: Int
    var articles: [Article]?
}
