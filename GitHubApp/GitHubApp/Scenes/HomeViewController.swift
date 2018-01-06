//
//  TopUserViewController.swift
//  GitHubApp
//
//  Created by admin on 1/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SVProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet fileprivate var collectionViewMain : UICollectionView!

    fileprivate var currentSelectedUsername : String?

    fileprivate var users : [String] = ["GrahamCampbell","fabpot","weierophinney","rkh","josh"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.setupUI()
        self.registerNibs()
        self.collectionViewMain.delegate = self
        self.collectionViewMain.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupUI() {
//        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.title = "Home"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)

    }

    private func registerNibs() {
        collectionViewMain.registerCellNib(UsernameCollectionViewCell.self)
    }

    fileprivate func openUserDetail(withUsername username : String) {
        self.currentSelectedUsername = username
        self.performSegue(withIdentifier: "UserDetailSegue", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UserDetailSegue" {
            if let vc = segue.destination as? PersonViewController {
                vc.username = self.currentSelectedUsername

            }
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let name = self.users[indexPath.item] 

        let width : CGFloat = name.widthWithConstrainedHeight(30, font: UIFont.systemFont(ofSize: 15)) + 20
        return CGSize(width: width, height: 40)
    }



    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // remove from top four

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UsernameCollectionViewCell", for: indexPath) as? UsernameCollectionViewCell else {
            return UICollectionViewCell()
        }

        let user = users[indexPath.item]
        myCell.setUsername(user)

        myCell.viewUserInfo = { [weak self] (username) in
            self?.openUserDetail(withUsername: username)
        }
        

        return myCell
    }
}



