class Player {
  let side: PlayerSide
  private(set) var pieces: Int

  init(side: PlayerSide) {
    self.side = side
    self.pieces = 9
  }
}