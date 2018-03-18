//
//  UIViewController+Storyboard.swift
//  Mari
//
//  Created by Mari Batilando on 3/17/18.
//  Copyright © 2018 Mari Batilando. All rights reserved.
//

import Foundation
import UIKit

/*
 Instantiate view controllers in a more type-safe way.
 Usage:
 1. Make sure storyboard filename is exactly named as subclass name
 2. Make sure storyboard identifier in storyboard is the same as the subclass name
 3. let viewController: MyAwesomeViewController = .createInstanceFromStoryboard()
 */
protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController: StoryboardIdentifiable {}

extension UIViewController {
    static func createInstanceFromStoryboard<T: UIViewController>() -> T {
        let storyboard = UIStoryboard(name: storyboardIdentifier, bundle: Bundle(for: self))
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! T
    }
}
