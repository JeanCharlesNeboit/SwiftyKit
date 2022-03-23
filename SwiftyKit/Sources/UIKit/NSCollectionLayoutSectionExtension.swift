//
//  NSCollectionLayoutSectionExtension.swift
//  
//
//  Created by Jean-Charles Neboit on 07/02/2022.
//

#if canImport(UIKit)
import UIKit

@available(iOS 13, *)
public enum SupplementaryViewKind: String {
    case header
    case footer
    
    var alignment: NSRectAlignment {
        switch self {
        case .header:
            return .top
        case .footer:
            return .bottom
        }
    }
}

@available(iOS 13, *)
public extension NSCollectionLayoutSection {
    private static func configureSupplementaryItems(for section: NSCollectionLayoutSection, supplementaryItems: [SupplementaryViewKind]) {
        section.boundarySupplementaryItems = Set<SupplementaryViewKind>(supplementaryItems).map {
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                  heightDimension: .estimated(20)),
                elementKind: $0.rawValue,
                alignment: $0.alignment)
        }
    }
    
    static func horizontalLayoutSection(scrollBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior = .groupPaging,
                                        itemInsets: NSDirectionalEdgeInsets = .zero,
                                        sectionInsets: NSDirectionalEdgeInsets = .zero,
                                        height: NSCollectionLayoutDimension = .fractionalHeight(1),
                                        groupWidth: NSCollectionLayoutDimension = .fractionalWidth(1),
                                        interGroupSpacing: CGFloat = 20,
                                        supplementaryItems: [SupplementaryViewKind] = [SupplementaryViewKind](),
                                        supplementariesFollowContentInsets: Bool = true) -> NSCollectionLayoutSection {
        // Items
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: height)

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = itemInsets

        // Groups
        let groupSize = NSCollectionLayoutSize(widthDimension: groupWidth,
                                               heightDimension: height)

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//        group.interItemSpacing = .fixed(20)

        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = scrollBehavior
        section.contentInsets = sectionInsets
        section.supplementariesFollowContentInsets = supplementariesFollowContentInsets
        section.interGroupSpacing = interGroupSpacing
        
        configureSupplementaryItems(for: section, supplementaryItems: supplementaryItems)

        return section
    }
    
    static func gridLayoutSection(itemHeight: NSCollectionLayoutDimension = .estimated(150),
                                  groupHeight: NSCollectionLayoutDimension = .estimated(150),
                                  column: Int = 2,
                                  sectionInsets: NSDirectionalEdgeInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0),
                                  interItemSpacing: CGFloat = 20,
                                  interGroupSpacing: CGFloat = 20,
                                  supplementaryItems: [SupplementaryViewKind] = [SupplementaryViewKind](),
                                  supplementariesFollowContentInsets: Bool = true) -> NSCollectionLayoutSection {
        // Items
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: itemHeight
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Groups
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: groupHeight
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: column
        )
        group.interItemSpacing = .fixed(interItemSpacing)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = sectionInsets
        section.supplementariesFollowContentInsets = supplementariesFollowContentInsets
        section.interGroupSpacing = interGroupSpacing
        
        configureSupplementaryItems(for: section, supplementaryItems: supplementaryItems)
        
        return section
    }
    
    static func tagLayoutSection(width: NSCollectionLayoutDimension = .estimated(100),
                                 height: NSCollectionLayoutDimension = .estimated(30),
                                 column: Int = 2,
                                 contentInset: NSDirectionalEdgeInsets = .init(top: 20, leading: 20, bottom: 20, trailing: 20),
                                 interItemSpacing: CGFloat = 20,
                                 interGroupSpacing: CGFloat = 20,
                                 supplementaryItems: [SupplementaryViewKind] = [SupplementaryViewKind]()) -> NSCollectionLayoutSection {
        // Items
        let itemSize = NSCollectionLayoutSize(
            widthDimension: width,
            heightDimension: height
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Groups
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: height
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.interItemSpacing = .fixed(interItemSpacing)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = interGroupSpacing
        section.contentInsets = contentInset

        configureSupplementaryItems(for: section, supplementaryItems: supplementaryItems)
        
        return section
    }
}
#endif
