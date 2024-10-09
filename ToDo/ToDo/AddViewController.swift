//
//  AddViewController.swift
//  ToDo
//
//  Created by yunus on 07.10.2024.
//

import UIKit
import SnapKit
import SQLite3

class AddViewController: UIViewController {
    let AddLabel: UILabel = {
        let label = UILabel()
        label.text = "Task"
        label.font = .boldSystemFont(ofSize: 40)
        return label
    }()
    let taskField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Task"
        field.borderStyle = .roundedRect
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Add Task"
        view.addSubview(AddLabel)
        AddLabel.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(30)
            make.top.equalTo(view.snp.top).offset(100)
        }
        view.addSubview(taskField)
        taskField.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(30)
            make.top.equalTo(view.snp.top).offset(150)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        
        
    }
}
