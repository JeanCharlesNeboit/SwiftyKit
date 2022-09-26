//
//  UndimmedDetentView.swift
//  
//
//  Created by Jean-Charles Neboit on 14/09/2022.
//

import UIKit
import SwiftUI

@available(iOS 16.0, *)
class UndimmedDetentController: UIViewController {
    // MARK: Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        avoidDimmingParent()
        avoidDisablingControls()
    }

    // MARK: Configure
    private func avoidDimmingParent() {
        sheetPresentationController?.largestUndimmedDetentIdentifier = .large
    }

    private func avoidDisablingControls() {
        presentingViewController?.view.tintAdjustmentMode = .normal
    }
}

@available(iOS 16.0, *)
struct UndimmedDetentView: UIViewControllerRepresentable {
    // MARK: Properties
    var largestUndimmedDetent: PresentationDetent?

    // MARK: UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> UIViewController {
        UndimmedDetentController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
