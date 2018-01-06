//
//  AppError.swift
//  GitHubApp
//
//  Created by admin on 1/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class AppError: Error {
    var statusCode : Int?
    var desc : String?

    init(_ statusCode : Int?, _ desc : String?) {
        self.statusCode = statusCode
        self.desc = desc
    }
}
