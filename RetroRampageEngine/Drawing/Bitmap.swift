public struct Bitmap {
    public private(set) var pixels: [Color]
    public let width: Int

    public var height: Int {
        return pixels.count / width
    }
    
    public subscript(x: Int, y: Int) -> Color {
        get { return pixels[y * width + x] }
        set { pixels[y * width + x] = newValue}
    }
    
    public init(width: Int, height: Int, color: Color) {
        self.width = width
        pixels = Array(repeating: color, count: width * height)
    }
}
