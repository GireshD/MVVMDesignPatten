//
//  Article.swift
//  MVVMDemo
//
//  Created by Giresh Dora on 22/07/19.
//  Copyright © 2019 Giresh Dora. All rights reserved.
//

import Foundation


struct ArticleList : Decodable {
    let articles: [Article]?
}

struct Article: Decodable {
    let title : String?
    let description: String?
}
