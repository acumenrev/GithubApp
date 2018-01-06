//
//  UICollectionViewExtensions.swift
//  GitHubApp
//
//  Created by admin on 1/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

import UIKit



extension UICollectionView {

    /**
     Register cell nib

     - parameter cellClass: Cell class
     */
    func registerCellNib(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }

    /**
     Register cell nib with alternative identifier

     - parameter cellClass:             Cell class
     - parameter alternativeIdentifier: Alternative identifier
     */
    func registerCellNib(_ cellClass : AnyClass, alternativeIdentifier : String) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: alternativeIdentifier)
    }

    /// Register header
    ///
    /// - Parameter cellClass: Cell Class
    func registerHeader(_ cellClass : AnyClass) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: identifier)
    }

    /// Register footer
    ///
    /// - Parameter cellClass: Cell Class
    func registeFooter(_ cellClass : AnyClass) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: identifier)
    }
}
