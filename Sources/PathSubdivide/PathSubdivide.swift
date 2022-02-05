//
//  PathSubdivide.swift
//  PathSubdivide
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/PathSubdivide/blob/master/LICENSE for license information.
//

import SwiftUI

public extension Shape {
  
  func subdivide(times: Int = 1) -> some Shape {
    return PathSubdivider(shape: self, times: times)
      .subdivide()
  }
  
}

/// Subdivide a shape
public struct PathSubdivider<S> where S: Shape {
  
  /// The shape to subdivide
  let shape: S
  
  /**
   The number of times to subdivide
   
    Examples:
   - 4 sided polygon subdivided 1 time = 4 sided polygon
   - 4 sided polygon subdivided 2 time = 8 sided polygon
   - 4 sided polygon subdivided 1 time = 16 sided polygon
   */
  let times: Int
  
  public init(shape: S, times: Int = 1) {
    self.shape = shape
    self.times = times
  }
  
  public func subdivide() -> SubdividedShape {
    
    /**
     If you don't want to subdivide, you get the a copy of your shape back.
     */
    guard times > 0 else {
      // Note: I wish I could just pass back `self.shape` here
      return SubdividedShape(elements: shape.path(in: .unit).elements())
    }
    
    // Subdivide until satisfied
    var shape = SubdividedShape(elements: shape.path(in: CGRect(x: 0, y: 0, width: 100, height: 100)).elements())
    for _ in 0..<times {
      shape = SubdividedShape(elements: calculateNewPathElements(shape: shape))
    }
    
    return shape
  }
  
  private func calculateNewPathElements<S>(shape: S) -> [Path.Element] where S: Shape {

    let path = shape.path(in: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    var elements: [Path.Element] = []
    
    var startPoint: CGPoint?
    var lastPoint: CGPoint = .zero
    
    path.forEach { element in
      switch element {
      case .move(to: let to):
        lastPoint = to
        
        elements.append(.move(to: to))
        
        guard startPoint == nil else {
          return
        }
        
        startPoint = to
      case .line(to: let to):
        
        let midpoint = lastPoint.midpoint(between: to)

        elements.append(Path.Element.line(to: midpoint))
        elements.append(Path.Element.line(to: to))
        
        lastPoint = to
      case .quadCurve(to: let to, control: let control):
        let (first, second) = BezierHelpers.subdivide(bezier: Bezier(start: lastPoint, finish: to, control1: control, control2: control))
        
        elements.append(.quadCurve(to: first.finish, control: first.control1))
        elements.append(.quadCurve(to: second.finish, control: second.control1))
        
        lastPoint = to
        
      case .curve(to: let to, control1: let control1, control2: let control2):
        
        let (first, second) = BezierHelpers.subdivide(bezier: Bezier(start: lastPoint, finish: to, control1: control1, control2: control2))
        
        elements.append(.curve(to: first.finish, control1: first.control1, control2: first.control2))
        elements.append(.curve(to: second.finish, control1: second.control1, control2: second.control2))
        
        lastPoint = to
      case .closeSubpath:
        
        guard let to = startPoint else {
          return
        }
        
        let midpoint = lastPoint.midpoint(between: to)

        elements.append(Path.Element.line(to: midpoint))
        elements.append(.closeSubpath)
        
        lastPoint = to
      }
    }
    
    return elements
    
  }
  
}
