struct Position {
  var x: Int
  var y: Int
  var side: PlayerSide

  init(position: String) {
    let positions = Array(position)
    self.x = Int(positions[0].asciiValue!) - 64
    self.y = positions[1].wholeNumberValue!
    self.side = PlayerSide.None
  }
}

public class GameBoard {
  var positions: [Position] = []

  init() {
    self.populatePositions()
  }

  func populatePositions() {
    let allPositions = [
      "А1", "D1", "G1",
      "B2", "D2", "F2",
      "C3", "D3", "E3",
      "A4", "B4", "C4", "E4", "F4", "G4",
      "C5", "D5", "E5",
      "B6", "D6", "F6",
      "А7", "D7", "G7",
    ]
    for p in allPositions {
      positions.append(Position(position: p))
    }
  }
}