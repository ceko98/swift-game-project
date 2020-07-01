class Player {
  let side: PlayerSide
  private(set) var totalPieces: Int
  var placedPieces: Int

  init(_ side: PlayerSide) {
    self.side = side
    self.totalPieces = 9
    self.placedPieces = 0
  } 
}