//
//  NewsViewController.swift
//  newsApp
//
//  Created by yunus on 02.03.2024.
//


import UIKit
import SafariServices

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    var newsData: NewsData?
    var newsManager = NewsManager()
    var timer = Timer()
    
    override func viewDidLoad() {
            super.viewDidLoad()
            timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(newFetch), userInfo: nil, repeats: true)
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData?.articles.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCellIdentifier", for: indexPath) as! NewsTableViewCell

        if let article = newsData?.articles[indexPath.row] {
            cell.titleLabel.text = article.title
            cell.setImage(urlString: article.urlToImage)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let article = newsData?.articles[indexPath.row], let url = URL(string: article.url) {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    @objc func newFetch(){
        newsManager.fetchNews(queryNews: "everything") { [weak self] newsData in
            self?.newsData = newsData
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

