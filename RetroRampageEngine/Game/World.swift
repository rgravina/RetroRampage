public struct World {
    public let map: Tilemap
    public var player: Player

    public init(map: Tilemap) {
        self.map = map
        self.player = Player(position: map.size / 2)
    }
}

public extension World {
    var size: Vector {
        return map.size
    }

    mutating func update(timeStep: Double) {
        player.position += player.velocity * timeStep
        player.position.x.formTruncatingRemainder(dividingBy: 8)
        player.position.y.formTruncatingRemainder(dividingBy: 8)
    }
}
