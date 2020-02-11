//
//  User.swift
//  HomeWork2.4
//
//  Created by Alex Sander on 11.02.2020.
//  Copyright © 2020 Alex Sander. All rights reserved.
//

struct User {
    var username: String
    var password: String
}

extension User {
    static func defaultUser() -> User {
        return User(username: "Alex", password: "Test")
    }
}
