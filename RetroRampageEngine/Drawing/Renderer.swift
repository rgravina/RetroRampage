public struct Renderer {
    public private(set) var bitmap: Bitmap
    
    public init(width: Int, height: Int) {
        bitmap = Bitmap(width: width, height: height, color: .white)
    }
    
    public mutating func draw(_ world: World) {
        let scale = Double(bitmap.height) / world.size.y
        
        var rect = world.player.rect
        rect.min *= scale
        rect.max *= scale
        bitmap.fill(rect: rect, color: .blue)
    }
}
