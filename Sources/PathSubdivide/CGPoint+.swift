//
//  CGPoint+.swift
//  PathSubdivide
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/PathSubdivide/blob/main/LICENSE for license information.
//

import CoreGraphics

public extension CGPoint {
  
  static func * (value: CGFloat, point: CGPoint) -> CGPoint {
    return CGPoint(x: point.x * value, y: point.y * value)
  }
  
  static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
  }
  
  static func / (point: CGPoint, value: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / value, y: point.y / value)
  }
  
  func magnitude() -> CGFloat {
    sqrt(x * x + y * y)
  }
  
  func distance(to: CGPoint) -> CGFloat {
    CGPoint(x: to.x - x, y: to.y - y).magnitude()
  }
  
  func midpoint(between: CGPoint) -> CGPoint {
    CGPoint(x: (self.x + between.x) / 2, y: (self.y + between.y) / 2)
  }
  
}
