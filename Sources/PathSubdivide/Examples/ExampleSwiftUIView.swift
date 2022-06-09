//
//  ExampleSwiftUIView.swift
//  PathSubdivide
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/PathSubdivide/blob/main/LICENSE for license information.
//

import SwiftUI
import PathElements

struct ExampleSwiftUIView {
  
  @State var isAnimating: Bool = false
  
}

extension ExampleSwiftUIView: View {
  
  var body: some View {
    VStack(spacing: 24) {
      test0
      test1
      test2
      controls
    }
  }
  
  var test0: some View {
    Rectangle()
      .stroke(Color.red, lineWidth: 5)
      .frame(width: 100, height: 100)
      .background(Color.yellow)
  }
  
  var test1: some View {
    Rectangle()
      .subdivide(times: isAnimating ? 1 : 2)
      .elements { index, lastPoint, element in

              if case let Path.Element.line(to: point) = element {
                
                let scaledLast = lastPoint
                let scaledPoint = point
                
                Path { path in
                  path.move(to: scaledLast)
                  path.addLine(to: scaledPoint)
                }
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: CGLineCap.round))
                .foregroundColor(index % 2 == 0 ? Color.red : Color.green)
                .frame(width: 100, height: 100)
              }
              
            }
      .frame(width: 100, height: 100)
      .background(Color.yellow)
  }
  
  var test2: some View {
    Rectangle()
      .subdivide(times: isAnimating ? 2 : 4)
      .elements { index, lastPoint, element in

              if case let Path.Element.line(to: point) = element {
                
                let scaledLast = lastPoint
                let scaledPoint = point
                
                Path { path in
                  path.move(to: scaledLast)
                  path.addLine(to: scaledPoint)
                }
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: CGLineCap.round))
                .foregroundColor(index % 2 == 0 ? Color.red : Color.blue)
                .frame(width: 100, height: 100)
              }
              
            }
      .frame(width: 100, height: 100)
      .background(Color.yellow)
  }
  
  var controls: some View {
    Button {
      isAnimating.toggle()
    } label: {
      Text("Animate Toggle")
    }

  }
}

#if DEBUG

struct ExampleSwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    ExampleSwiftUIView()
  }
}

#endif
