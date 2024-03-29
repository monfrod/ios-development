//
//  HomeViewController.swift
//  Netflix clone
//
//  Created by yunus on 09.12.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeFeedTable: UITableView = {
        
        let table = UITableView()
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello world"
        return cell
    }
}
