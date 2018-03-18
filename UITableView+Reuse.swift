//
//  UITableView+Reuse.swift
//  Mari
//
//  Created by Mari Batilando on 3/17/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

import Foundation
import UIKit

protocol ViewIdentifiable {
    static var reusableIdentifier: String { get }
}

extension ViewIdentifiable where Self: UIView {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

extension UIView: ViewIdentifiable {}

extension UITableView {
    func register<T: UITableViewCell>(_ reusableCell: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reusableIdentifier)
    }
    
    func registerNib<T: UITableViewCell>(_ reusableCell: T.Type) {
        let nib = UINib(nibName: T.reusableIdentifier, bundle: Bundle(for: T.self))
        register(nib, forCellReuseIdentifier: T.reusableIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ reusableCell: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.reusableIdentifier, for: indexPath) as! T
    }
    
    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(_ headerFooterView: T.Type) {
        let nib = UINib(nibName: T.reusableIdentifier, bundle: Bundle(for: T.self))
        register(nib, forHeaderFooterViewReuseIdentifier: T.reusableIdentifier)
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ headerFooterView: T.Type) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: T.reusableIdentifier) as! T
    }
}
