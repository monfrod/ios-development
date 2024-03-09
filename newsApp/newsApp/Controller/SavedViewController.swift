//
//  SavedViewController.swift
//  newsApp
//
//  Created by yunus on 06.03.2024.
//

import UIKit
import SafariServices

class SavedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

        
    @IBOutlet weak var tableView: UITableView!
    
    var newsData: NewsData?
    var newsManager = NewsManager()
    var savedNews: [StorageManager] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        
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
    


}
