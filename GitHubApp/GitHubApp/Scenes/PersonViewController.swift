//
//  UserDetailViewController.swift
//  GitHubApp
//
//  Created by admin on 1/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import Kingfisher
import SVProgressHUD

class PersonViewController: UIViewController {

    var username : String?

    @IBOutlet private weak var imgViewAvatar : UIImageView!
    @IBOutlet private weak var lblFullname : UILabel!
    @IBOutlet private weak var lblLocation : UILabel!
    @IBOutlet private weak var viewUnderline : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgViewAvatar.layer.cornerRadius = imgViewAvatar.bounds.width/2
        imgViewAvatar.clipsToBounds = true

        self.setupUI()
        self.getUserInfo(withUsername: self.username ?? "")
    }

    private func setupUI() {
        self.title = "Person"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func getUserInfo(withUsername username: String) {
//        SVProgressHUD.show()
        APIGitHub.getGitHubUserInfo(withUsername: username) { [weak self] (user, err) in
//            SVProgressHUD.dismiss()
            if let user = user {
                self?.bindingDataONUI(withUser: user)

            } else if let err = err {
                // show alert
                var msg : String = ""
                if let appErr = err as? AppError {
                    msg = appErr.desc ?? ""
                } else {
                    msg = err.localizedDescription
                }

                self?.showAlertWith(Title: "Error", Message: msg, CancelTitle: "OK", OKTitle: nil, CancelHandler: nil, OKHandler: nil)
            }
        }
    }

    private func bindingDataONUI(withUser user : UserModel) {
        viewUnderline.isHidden = false
        lblFullname.text = user.fullname
        lblLocation.text = user.location

        let url = URL(string: user.avatarUrl ?? "")
        self.imgViewAvatar?.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(0.2))])
    }

    func showAlertWith(Title title : String?, Message msg : String?, CancelTitle cancel : String?, OKTitle : String?,
                       CancelHandler cancelhandler : (() -> ())? ,
                       OKHandler okHandler : (() -> ())?) {

        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)

        if (cancel?.isEmpty == false) {
            let action = UIAlertAction(title: cancel, style: .cancel, handler: { (action) in
                cancelhandler?()
            })

            alertController.addAction(action)
        }

        if (OKTitle?.isEmpty == false) {
            let action = UIAlertAction(title: OKTitle, style: .default, handler: { (action) in
                okHandler?()
            })

            alertController.addAction(action)
        }


        self.present(alertController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
