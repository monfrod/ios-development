//
//  AppDelegate.swift
//  ToDo
//
//  Created by yunus on 07.10.2024.
//

import UIKit
import SQLite3

var dbQueue: OpaquePointer?
var dbURL = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        dbQueue = createAndOpenDatabase()
        
        if createTable() == false{
            print("Error1")
        } else {
            print("table created")
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func createAndOpenDatabase()->OpaquePointer?{
        var db: OpaquePointer?
        
        let url = NSURL(fileURLWithPath: dbURL)
        
        if let pathComponent = url.appendingPathComponent("todo.sqlite"){
            let filePath = pathComponent.path()
            
            if sqlite3_open(filePath, &db) == SQLITE_OK {
                print("succesfully open database at \(filePath)")
                return db
            }
            else{
                print("fail1")
            }
        } else {
            print("database in not available")
        }
        
        return db
        
    }
    func createTable()->Bool{
        var bRetVal:Bool = false
        
        let createTableQuery = """
                CREATE TABLE IF NOT EXISTS ToDoList (
                    ID INTEGER PRIMARY KEY AUTOINCREMENT,
                    task TEXT,
                    deadline TEXT,
                    status TEXT
                );
                """
//        let query = " CREATE TABLE IF NOT EXISTS ToDoList (ID INTEGER PRIMARY KEY AUTOINCREMENT,task TEXT,deadline TEXT,status TEXT);"
        
        let createTable = sqlite3_exec(dbQueue, createTableQuery, nil, nil, nil)
        
        if (createTable != SQLITE_OK){
            print("fail2")
            bRetVal = false
        } else {
            bRetVal = true
        }
        return bRetVal
        
    }

}

