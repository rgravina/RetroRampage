public struct Renderer {
    public private(set) var bitmap: Bitmap
    
    public init(width: Int, height: Int) {
        bitmap = Bitmap(width: width, height: height, color: .white)
    }
    
    public mutating func draw(_ player: Player) {
        bitmap[Int(player.position.x), Int(player.position.y)] = .blue
    }
}
