struct Position {
  var x: Int
  var y: Int
  var side: PlayerSide
  var symbol: String {
    switch self.side {
      case .First: return "○"
      case .Second: return "●"
      case .None: return "·"        
    }
  }

  init(position: String) {
    let positions = Array(position)
    self.x = Int(positions[0].asciiValue!) - 64
    self.y = positions[1].wholeNumberValue!
    self.side = PlayerSide.None
  }
}
