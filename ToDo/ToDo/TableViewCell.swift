//
//  TableViewCell.swift
//  ToDo
//
//  Created by yunus on 07.10.2024.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell{
    
    static let identifier: String = "TableViewCell"
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        myLabel.text = "TEST!!!"
        contentView.addSubview(myLabel)
        myLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView.snp.left)
        }
        
    }
}
