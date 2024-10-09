//
//  ViewController.swift
//  todolist.vs1
//
//  Created by yunus on 05.10.2024.
//

import UIKit
import SQLite3
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    var field1 = UITextField()
    var field2 = UITextField()
    var field3 = UITextField()
    let button = UIButton()
    let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        field1.delegate = self
        field2.delegate = self
        field3.delegate = self
        view.backgroundColor = .darkGray
        
        field1.backgroundColor = .white
        field1.borderStyle = .roundedRect
        field1.textColor = .black
        view.addSubview(field1)
        field1.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.snp.top).offset(200)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        field2.backgroundColor = .white
        field2.borderStyle = .roundedRect
        field2.textColor = .black
        view.addSubview(field2)
        field2.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.snp.top).offset(300)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        field3.backgroundColor = .white
        field3.borderStyle = .roundedRect
        field3.textColor = .black
        view.addSubview(field3)
        field3.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.snp.top).offset(400)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(650)
            make.centerX.equalTo(view)
            make.width.equalTo(100)
        }
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    @objc func buttonTapped(){
        
        //INSERT
        
        let insertStatementString = "INSERT INTO ToDoList (task, deadline, status) VALUES (?,?,?);"
        
        var insertStatementQuery: OpaquePointer?
        
        if (sqlite3_prepare_v2(dbQueue, insertStatementString, -1, &insertStatementQuery, nil)) == SQLITE_OK{
            sqlite3_bind_text(insertStatementQuery, 1, field1.text ?? "", -1, SQLITE_TRANSIENT)
            sqlite3_bind_text(insertStatementQuery, 2, field2.text ?? "", -1, SQLITE_TRANSIENT)
            sqlite3_bind_text(insertStatementQuery, 3, field3.text ?? "", -1, SQLITE_TRANSIENT)
            print("djlnfdjafl")
            
            if (sqlite3_step(insertStatementQuery)) == SQLITE_DONE {
                field1.text = ""
                field2.text = ""
                field3.text = ""
            } else{
                print("error4")
            }
            sqlite3_finalize(insertStatementQuery)
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(dbQueue))
            print("Ошибка при подготовке SQL-запроса: \(errorMessage)")
        }
        // SELECT
        
        let selectStatementString = "SELECT * FROM ToDoList"
        
        var selectStatementQuery: OpaquePointer?
        
        var sShowData: String!
        sShowData = ""
        if (sqlite3_prepare_v2(dbQueue, selectStatementString, -1, &selectStatementQuery, nil)) == SQLITE_OK {
            while sqlite3_step(selectStatementQuery) == SQLITE_ROW {
                sShowData += String(cString: sqlite3_column_text(selectStatementQuery, 1))+", "+String(cString: sqlite3_column_text(selectStatementQuery, 2))+", "+String(cString: sqlite3_column_text(selectStatementQuery, 3))+"..."
            }
            sqlite3_finalize(insertStatementQuery)
        }
        print(sShowData!)
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
 
