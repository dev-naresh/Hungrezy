//
//  UserAccountDatabaseService.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 29/03/23.
//

import Foundation
import SQLite3

class UserAccountDatabaseService {
    
    var DB: OpaquePointer?
    var dbUrl: URL
    
    init() {
        self.dbUrl = try! FileManager.default.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false).appendingPathComponent("hungrezy.sqlite")
        print(dbUrl.path)
        if sqlite3_open(dbUrl.path, &DB) == SQLITE_OK {
            print("Database connected successfully")
            createUserTable(success: success, failure: failure)
        }
        else {
            print("Database failed to connect")
        }
    }
    
    private func success(message: String) {
        print(message)
    }
    
    private func failure(message: String) {
        print(message)
    }
}

extension UserAccountDatabaseService: UserAccountDatabaseContract {
    func createUserTable(success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        var statement: OpaquePointer?
        let query = "create table if not exists User(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, phoneNumber INTEGER, emailID TEXT, password TEXT, userType INTEGER, profilePictureURL TEXT);"
        if sqlite3_prepare(DB, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE{
                success("User table created")
            } else {
                failure("User table not created")
            }
        } else {
            failure("User table not created \(sqlite3_errmsg(DB)!)")
        }
        sqlite3_finalize(statement)
    }
    
    func insertIntoUserTable(user: User, success: @escaping (User) -> Void, failure: @escaping (String) -> Void) {
        var statement: OpaquePointer?
        let query = "insert into User(\"id\",\"name\",\"phoneNumber\",\"emailID\",\"password\",\"userType\") values(\"\(user.id)\", \"\(user.name)\", \(user.phoneNumber), \"\(user.emailID)\", \"\(user.password)\", \"\(user.userType.rawValue)\");"
        print(query)
        if sqlite3_prepare(DB, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE{
                print("User added")
                success(user)
            } else {
                failure("User not added")
            }
        } else {
            print(sqlite3_errmsg(DB)!)
            failure("User not added")
        }
        sqlite3_finalize(statement)
    }
    
    func fetchAccountInfo(emailID: String, success: @escaping (User) -> Void, failure: @escaping (String) -> Void) {
        var statement: OpaquePointer?
        let query = "select * from User where emailID=\"\(emailID)\";"
        if sqlite3_prepare(DB, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_ROW {
                let id = String(cString: sqlite3_column_text(statement, 0))
                let name = String(cString: sqlite3_column_text(statement, 1))
                let phoneNumber = sqlite3_column_int(statement, 2)
                let emailID = String(cString: sqlite3_column_text(statement, 3))
                let password = String(cString: sqlite3_column_text(statement, 4))
                var profilePictureURL: String?
                if let url = sqlite3_column_text(statement, 5) {
                    profilePictureURL = String(cString: url)
                }
//                let profilePictureURL = String(cString: sqlite3_column_text(statement, 5))
                let userType = sqlite3_column_int(statement, 6)
                let user = User(id: id, name: name, phoneNumber: Int64(phoneNumber), emailID: emailID, password: password, profilePictureURL: profilePictureURL, userType: UserType(rawValue: Int(userType)) ?? UserType.Customer)
                success(user)
            } else {
                failure("Failed to fetch data")
            }
        } else {
            failure("Failed to fetch data")
        }
        sqlite3_finalize(statement)
    }
    
    func truncateTable(success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        var statement: OpaquePointer?
        let query = "delete from User;"
        if sqlite3_prepare(DB, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                success("Table truncated")
            } else {
                failure("Failed to truncate")
            }
        } else {
            failure("Failed to truncate")
        }
        sqlite3_finalize(statement)
    }
}
