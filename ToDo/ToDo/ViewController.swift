//
//  ViewController.swift
//  ToDo
//
//  Created by yunus on 07.10.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    // MARK: UIComponents
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
         
        return tableView
    }()
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupUI()
        title = "ToDo List"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    //MARK: SetupUI
    private func setupUI(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let rightButton = UIBarButtonItem(title: "Add task", style: .plain, target: self, action: #selector(addTask))
        navigationItem.rightBarButtonItem = rightButton
    }
    //MARK: Button Func
    
    @objc private func addTask(){
        navigationController?.pushViewController(AddViewController(), animated: false)
    }
}

//MARK: TableViewDelegate
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else{
            fatalError("Cell error")
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    }
}

//MARK: SQLite
extension ViewController{
    
}
