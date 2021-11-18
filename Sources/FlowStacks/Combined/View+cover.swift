import Foundation
import SwiftUI

extension View {
  
  /// A shim for presenting a full-screen cover that falls back on a sheet presentation on platforms
  /// where fullScreenCover is unavailable.
  @ViewBuilder
  func cover<Content: View>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View {
    if #available(iOS 14.0, tvOS 14.0, macOS 99.9, *) {
      self
        .fullScreenCover(
          isPresented: isPresented,
          onDismiss: nil,
          content: content
        )
    } else {
      self
        .sheet(
          isPresented: isPresented,
          onDismiss: nil,
          content: content
        )
    }
  }
}