//
//  ArticleViewModel.swift
//  MVVMDemo
//
//  Created by Giresh Dora on 23/07/19.
//  Copyright © 2019 Giresh Dora. All rights reserved.
//

import Foundation

/**
   This ArticleListViewModel struct is represent list of Articles.
 */
struct ArticleListViewModel {
    private let articles: [Article]
    
    init(_ articles: [Article]) {
        self.articles = articles
    }
    
    var numberOfSetions: Int {
        return 1
    }
    
    func numberOfRowInSection(_ section:Int) -> Int{
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel{
        let article = articles[index]
        return ArticleViewModel(article)
    }
}

/**
   This ArticleViewModel struct is represent only one Article.
 */
struct ArticleViewModel {
    private let article: Article
    
    init(_ article:Article) {
        self.article = article
    }
    
    var title: String {
        return self.article.title ?? ""
    }
    
    var description: String {
        return self.article.description ?? ""
    }
}
