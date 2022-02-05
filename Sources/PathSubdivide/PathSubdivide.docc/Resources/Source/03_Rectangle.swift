import SwiftUI
import PathSubdivide
import PathWarp

struct ExampleSwiftUIView {}

extension ExampleSwiftUIView: View {
  
  var body: some View {
    Rectangle()
      .subdivide()
      .warp(amount: 10, seed: 4568765687)
      .stroke(Color.red, lineWidth: 2)
      .frame(width: 100, height: 100)
  }
}
