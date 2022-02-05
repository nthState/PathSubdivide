//
//  BezierHelpers.swift
//  PathSubdivide
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/PathSubdivide/blob/main/LICENSE for license information.
//


import CoreGraphics

struct Bezier {
  let start: CGPoint
  let finish: CGPoint
  let control1: CGPoint
  let control2: CGPoint
}

internal class BezierHelpers {

  class func subdivide(bezier: Bezier, at: CGFloat = 0.5) -> (first: Bezier, second: Bezier) {
    
    let firstStart = bezier.start
    let firstControl1 = (bezier.start + bezier.control1) / 2
    let firstControl2 = (bezier.start + (2 * bezier.control1 + (bezier.control2))) / 4
    let firstFinish = (bezier.start + (3 * bezier.control1) + (3 * bezier.control2) + bezier.finish) / 8
  
    let first = Bezier(start: firstStart, finish: firstFinish, control1: firstControl1, control2: firstControl2)
    
    
    let secondStart = firstFinish
    let secondControl1 = (bezier.control1 + (2 * bezier.control2 + (bezier.finish))) / 4
    let secondControl2 = (bezier.control2 + bezier.finish) / 2
    let secondFinish = bezier.finish
    
    let second = Bezier(start: secondStart, finish: secondFinish, control1: secondControl1, control2: secondControl2)
    
    return (first, second)
  }
      
}
