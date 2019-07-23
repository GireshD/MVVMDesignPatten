//
//  NewsListViewController.swift
//  MVVMDemo
//
//  Created by Giresh Dora on 22/07/19.
//  Copyright © 2019 Giresh Dora. All rights reserved.
//

import UIKit

let API_KEY = "NEWS_API_KEY" // https://newsapi.org Get your News API and past your News API key here

class NewsListViewController: UITableViewController {

    private var articleListViewModel: ArticleListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        callNewsAPI()
    }

    // MARK: - Custome Methods
    
    func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func callNewsAPI(){
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=\(API_KEY)")!
        
        WebService.shared.getArticles(url: url) { articles in
            if let articles = articles{
                self.articleListViewModel = ArticleListViewModel(articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.articleListViewModel?.numberOfSetions ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.articleListViewModel?.numberOfRowInSection(section) ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTVCell", for: indexPath) as? ArticleTVCell else {
            fatalError("Error in cellforRow")
        }
        
        let article = self.articleListViewModel?.articleAtIndex(indexPath.row)
        cell.titleLbl.text = article?.title
        cell.descriptionLbl.text = article?.description
        
        return cell
    }
    
}
