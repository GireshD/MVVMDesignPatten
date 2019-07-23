//
//  WebService.swift
//  MVVMDemo
//
//  Created by Giresh Dora on 22/07/19.
//  Copyright © 2019 Giresh Dora. All rights reserved.
//

import Foundation

class WebService {
    
    static let shared: WebService = WebService()
    
    private init() {}
    
    /**
       This function retun list of Articles if sucess else retun nill
      */
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { (data, urlResponce, error) in
            
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data{
                
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList = articleList {
                    completion(articleList.articles)
                }
            }
        }.resume()
    }
}
