//
//  NewsTableViewCell.swift
//  newsApp
//
//  Created by yunus on 02.03.2024.
//

import UIKit

class NewsTableViewCell: UITableViewCell{

    
    @IBOutlet weak var NewsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setImage(urlString: String?) {
        NewsImage.image = nil

        if let imageUrlString = urlString, let imageUrl = URL(string: imageUrlString) {
            URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                if let imageData = data {
                    DispatchQueue.main.async {
                        self.NewsImage.image = UIImage(data: imageData)
                    }
                }
            }.resume()
        }
    }

}
