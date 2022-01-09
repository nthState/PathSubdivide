//
//  RectangleTests.swift
//  PathSubdivide
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/PathSubdivide/blob/main/LICENSE for license information.
//

import XCTest
import SwiftUI
@testable import PathSubdivide

final class RectangleTests: XCTestCase {
  
  func test_four_segment_rect_subdivided_no_times_is_still_four_segment() throws {
    
    let shape = Rectangle()
    
    let subdivided = shape.subdivide(times: 0)
    
    let actual = subdivided.path(in: .unit).elements().count
    
    XCTAssertEqual(actual, 5, "We should have 5 points")
  }
  
  func test_four_segment_rect_becomes_eight_segment() throws {
    
    let shape = Rectangle()
    
    let subdivided = shape.subdivide()
    
    let actual = subdivided.path(in: .unit).elements().count
    
    XCTAssertEqual(actual, 9, "We should have 9 points")
  }
  
}
