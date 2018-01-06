//
//  JSONProtocol.swift
//  GitHubApp
//
//  Created by admin on 1/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

import SwiftyJSON


typealias JSONData = JSON
typealias JSONDict = [String : Any]

protocol JSONProtocol {
    init(_ dict : JSONData?)
    func parse(_ dict : JSONData?)
    func jsonDict() -> JSONDict?
}
