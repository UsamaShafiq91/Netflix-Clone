//
//  CellProtocol.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 08/05/2023.
//

import Foundation
import UIKit

protocol ReusableView: AnyObject {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

protocol NibLoadableView: AnyObject { }

extension NibLoadableView where Self: UIView {
    
    static var NibName: String {
        return String(describing: self)
    }
}
