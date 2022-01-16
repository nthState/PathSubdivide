# ``PathSubdivide``

PathSubdivide takes a shape and subdivides it's paths so you get more segments
on the shape. This is useful if you warping your shapes

Use like

```
Rectangle()
  .subdivide(times: 2)
```

As an extension on `Shape`

```
public extension Shape {
  
  func subdivide(times: Int = 1) -> some Shape {
    return PathSubdivider(shape: self, times: times)
      .subdivide()
  }
  
}
```

## Overview

Text

## Topics

### Group

- <doc:Getting-Started-with-PathSubdivide>
- <doc:Developer-Diary>

- ``PathSubdivide/PathSubdivider``

- ``PathSubdivide/SubdividedShape``