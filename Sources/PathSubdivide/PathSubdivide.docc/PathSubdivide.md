# ``PathSubdivide``

PathSubdivide takes a shape and subdivides it's paths so you get more segments
on the shape. This is useful if you warping your shapes

Use like

![After](04_Rectangle.png)

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

## Topics

### Group

- <doc:Getting-Started-with-PathSubdivide>

- ``PathSubdivide/PathSubdivider``

- ``PathSubdivide/SubdividedShape``
