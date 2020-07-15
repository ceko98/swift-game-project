class Player {
  let side: PlayerSide
  private(set) var totalPieces: Int
  private(set) var placedPieces: Int
  var canJump: Bool {
    return totalPieces <= 3
  }
  var hasToMove: Bool {
    return placedPieces == totalPieces
  }

  init(_ side: PlayerSide) {
    self.side = side
    self.totalPieces = 9
    self.placedPieces = 0
  }

  func placePiece() {
    placedPieces += 1
  }

  func removePiece() {
    totalPieces -= 1
    placedPieces -= 1
  }
}