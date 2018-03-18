//
//  UICollectionView+Reuse.swift
//  Mari
//
//  Created by Mari Batilando on 3/17/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_ reusableCell: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reusableIdentifier)
    }
    
    func registerNib<T: UICollectionViewCell>(_ reusableCell: T.Type) {
        let nib = UINib(nibName: T.reusableIdentifier, bundle: Bundle(for: T.self))
        register(nib, forCellWithReuseIdentifier: T.reusableIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_ reusableCell: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reusableIdentifier, for: indexPath) as! T
    }
}
