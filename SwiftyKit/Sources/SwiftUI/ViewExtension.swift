//
//  ViewExtension.swift
//  
//
//  Created by Jean-Charles Neboit on 14/02/2022.
//

#if canImport(UIKit)
import SwiftUI

// MARK: - RoundedCorner
@available(iOS 13.0, *)
public struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

@available(iOS 13.0, *)
extension View {
     public func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

// MARK: - SizePreferenceKey
@available(iOS 13.0, *)
struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

@available(iOS 13.0, *)
extension View {
     public func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

// MARK: - PresentationDetents
@available(iOS 16.0, *)
extension View {
    public func presentationDetents(
        undimmed detents: Set<PresentationDetent>
    ) -> some View {
        self.background(UndimmedDetentView())
            .presentationDetents(detents.withLarge())
    }

    public func presentationDetents(
        undimmed detents: Set<PresentationDetent>,
        selection: Binding<PresentationDetent>
    ) -> some View {
        self.background(UndimmedDetentView())
            .presentationDetents(
                detents.withLarge(),
                selection: selection
            )
    }
}
#endif
