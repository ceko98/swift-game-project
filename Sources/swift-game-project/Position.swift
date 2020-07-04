class Position {
  let x: Int
  let y: Int
  var side: PlayerSide
  var symbol: String {
    switch self.side {
      case .First: return "○"
      case .Second: return "●"
      case .None: return "·"        
    }
  }

  init(_ position: String) {
    self.x = Int(position.first!.asciiValue!) - 64
    self.y = position.last!.wholeNumberValue!
    self.side = PlayerSide.None
  }
}

extension Position: Equatable {
  static func ==(_ lhs: Position, _ rhs: Position) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
  }
}
