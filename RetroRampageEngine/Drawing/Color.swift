public struct Color {
    var r, g, b: UInt8
    var a: UInt8 = 255
}

extension Color {
    public static let clear = Color(r: 0, g: 0, b: 0, a: 0)
    public static let black = Color(r: 0, g: 0, b: 0)
    public static let white = Color(r: 255, g: 255, b: 255)
    public static let gray = Color(r: 192, g: 192, b: 192)
    public static let red = Color(r: 255, g: 0, b: 0)
    public static let green = Color(r: 0, g: 255, b: 0)
    public static let blue = Color(r: 0, g: 0, b: 255)
}
