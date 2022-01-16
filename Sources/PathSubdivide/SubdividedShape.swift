//
//  SubdividedShape.swift
//  PathSubdivide
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/PathSubdivide/blob/master/LICENSE for license information.
//

import SwiftUI

/// A custom shape that is built from a list of subdivided path elements
public struct SubdividedShape: Shape {
  
  private let elements: [Path.Element]
  
  internal init(elements: [Path.Element]) {
    self.elements = elements
  }
  
  public func path(in rect: CGRect) -> Path {
    var path = Path()
    
    for element in elements {
      switch element {
        
      case .move(to: let to):
        path.move(to: to)
      case .line(to: let to):
        path.addLine(to: to)
      case .quadCurve(to: let to, control: let control):
        path.addQuadCurve(to: to, control: control)
      case .curve(to: let to, control1: let control1, control2: let control2):
        path.addCurve(to: to, control1: control1, control2: control2)
      case .closeSubpath:
        path.closeSubpath()
      }
    }
    
    return path
  }
  
}
