//
//  UsernameCollectionViewCell.swift
//  GitHubApp
//
//  Created by admin on 1/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class UsernameCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var btnUsername : UIButton!

    var viewUserInfo : ((_ username : String) -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnUsername.layer.cornerRadius = 4

    }

    func setUsername(_ userName : String) {
        btnUsername.setTitle(userName, for: .normal)
    }

    @IBAction private func btnUsername_Touched(_ sender : UIButton?) {
        viewUserInfo?(btnUsername.titleLabel?.text ?? "")
    }

}
