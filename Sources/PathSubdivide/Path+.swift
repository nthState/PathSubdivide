//
//  Path+.swift
//  PathSubdivide
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/PathSubdivide/blob/main/LICENSE for license information.
//

import SwiftUI

extension Path {
  
  func elements() -> [Path.Element] {
    var elements: [Path.Element] = []
    self.forEach { element in
      elements.append(element)
    }
    return elements
  }
  
}
