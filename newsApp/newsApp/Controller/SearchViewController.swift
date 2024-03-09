//
//  SearchViewController.swift
//  newsApp
//
//  Created by yunus on 02.03.2024.
//

import UIKit
import SafariServices

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var newsData: NewsData?
    var newsManager = NewsManager()
    var query = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        print("searchViewController work")
        newsManager.fetchNews(queryNews: "apple") { [weak self] newsData in
            self?.newsData = newsData
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData?.articles.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCellIdentifier", for: indexPath) as! NewsTableViewCell

        if let article = newsData?.articles[indexPath.row] {
            cell.titleLabel.text = article.title
            cell.setImage(urlString: article.urlToImage)
        } else {
            print("Article is nil at indexPath: \(indexPath)")
        }


        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let article = newsData?.articles[indexPath.row], let url = URL(string: article.url) {
            // Открытие ссылки в Safari View Controller
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text{
            query = text
            newsManager.fetchNews(queryNews: query) { [weak self] newsData in
                self?.newsData = newsData
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
        textField.text = ""
        textField.placeholder = "Search"
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        } else {
            textField.placeholder = "Print query!"
            return false
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
}
