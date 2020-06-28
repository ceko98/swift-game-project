struct Position {
  var x: Character
  var y: Int

  init(position: String) {
    let positions = Array(position)
    self.x = positions[0]
    self.y = positions[1].wholeNumberValue!
  }
  
}

class GameBoard {
  var positions: [Position] = []

  init() {
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
    for pos in allPositions {
      positions.append(Position(position: pos))
    }
  }
}