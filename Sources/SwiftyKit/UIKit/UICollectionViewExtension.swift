//
//  UICollectionViewExtension.swift
//  SwiftyKit
//
//  Created by Jean-Charles Neboit on 25/05/2021.
//

#if canImport(UIKit)
import UIKit

extension UICollectionView {
    public func dequeueReusableCell<T: UICollectionViewCell & CellIdentifiable>(for indexPath: IndexPath) -> T? {
        dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T
    }
}
#endif
