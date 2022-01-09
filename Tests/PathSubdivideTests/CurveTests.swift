//
//  CurveTests.swift
//  PathSubdivide
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/PathSubdivide/blob/main/LICENSE for license information.
//

import XCTest
import SwiftUI
@testable import PathSubdivide

final class CurveTests: XCTestCase {
  
  func test_curve_segment_not_subdivided_has_no_changes() throws {
    
    let shape = Curve()
    
    let subdivided = shape.subdivide(times: 0)
    
    let actual = subdivided.path(in: .unit).elements().count
    
    XCTAssertEqual(actual, 2, "We should have 2 points")
  }
  
  func test_curve_breaks_into_two() throws {
    
    let shape = Curve()
    
    let subdivided = shape.subdivide()
    
    let actual = subdivided.path(in: .unit).elements().count
    
    XCTAssertEqual(actual, 3, "We should have 3 points")
  }
  
}
