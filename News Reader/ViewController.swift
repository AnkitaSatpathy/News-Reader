//
//  ViewController.swift
//  News Reader
//
//  Created by Ankita Satpathy on 01/02/17.
//  Copyright © 2017 Ankita Satpathy. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var articles: [Article]? = []
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchArticle()
    }
    
    func fetchArticle(){
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v1/articles?source=techcrunch&sortBy=top&apiKey=64872d87c2ca48f08e3d576a77a3f252")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil {
                print(error)
                return
            }
            
            self.articles = [Article]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                
                if let articlesFromJson = json["articles"] as? [[String : AnyObject]] {
                    for articleFromJson in articlesFromJson {
                        let article = Article()
                        if let title = articleFromJson["title"] as? String,  let desc = articleFromJson["description"] as? String, let url = articleFromJson["url"] as? String, let urlToImage = articleFromJson["urlToImage"] as? String {
                            
                          let imageurl = URL(string: urlToImage)
                            if   let imageData = NSData(contentsOf: imageurl!){
                                 let image = UIImage(data: imageData as Data)
                                 article.image = image
                            }
                            
                            article.desc = desc
                            article.headline = title
                            article.url = url
                           
                            
                        }
                        self.articles?.append(article)
                    }
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
                
            } catch let error {
                print(error)
            }

            
        }
        
        task.resume()
        
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! ArticleCell
        cell.headingLabel.text = self.articles?[indexPath.item].headline
        cell.descLabel.text = self.articles?[indexPath.item].desc
        cell.imageview.image = self.articles?[indexPath.item].image
        
        return cell
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let webvc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web") as! WebViewController
        webvc.url = self.articles?[indexPath.item].url
        self.present(webvc, animated: true, completion: nil)
        
    }
    
}
