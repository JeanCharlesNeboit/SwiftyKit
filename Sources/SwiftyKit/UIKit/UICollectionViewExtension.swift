//
//  UICollectionViewExtension.swift
//  SwiftyKit
//
//  Created by Jean-Charles Neboit on 25/05/2021.
//

#if canImport(UIKit)
import UIKit

// swiftlint:disable force_cast
extension UICollectionView {
    public func dequeueReusableCell<T: UICollectionViewCell & CellIdentifiable>(for indexPath: IndexPath) -> T? {
        dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell & CellIdentifiable>(for indexPath: IndexPath) -> T {
        dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}

extension UICollectionView {
    public func dequeueReusableSupplementaryView<T: UICollectionReusableView & CellIdentifiable>(kind: String, for indexPath: IndexPath) -> T? {
        dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.identifier, for: indexPath) as? T
    }
    
    public func dequeueReusableSupplementaryView<T: UICollectionReusableView & CellIdentifiable>(kind: String, for indexPath: IndexPath) -> T {
        dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}
// swiftlint:enable force_cast
#endif
