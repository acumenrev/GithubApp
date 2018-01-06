//
//  APIGitHub.swift
//  GitHubApp
//
//  Created by admin on 1/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIGitHub {
    init() {

    }

    static func getGitHubUserInfo(withUsername username : String, _ callback : ((_ user : UserModel?, _ err : Error?) -> ())?) {
        guard username.isEmpty == false else {
            let err = AppError.init(-1, "Username is not valid")
            callback?(nil, err)
            return
        }


        let url = "https://api.github.com/users/" + username

        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let user = UserModel.init(json)
                callback?(user, nil)
            case .failure(let error):
                callback?(nil, error)
            }
        }

    }
}
