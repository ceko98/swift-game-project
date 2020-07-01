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
    self.x = Int(position.first!.asciiValue!) - 64
    self.y = position.last!.wholeNumberValue!
    self.side = PlayerSide.None
  }
}
