//
//  UserModel.swift
//  GitHubApp
//
//  Created by admin on 1/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class UserModel: BaseModel, JSONProtocol {
    var avatarUrl : String?
    var fullname : String?
    var location : String?
    var username : String?

    required init(_ dict: JSONData?) {
        super.init()
        self.parse(dict)
    }

    func parse(_ dict: JSONData?) {
        self.avatarUrl = dict?.stringForKey("avatar_url")
        self.username = dict?.stringForKey("login")
        self.fullname = dict?.stringForKey("name")
        self.location = dict?.stringForKey("location")
    }

    func jsonDict() -> JSONDict? {
        return nil
    }
}
