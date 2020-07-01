public class GameBoard {
  var positions: [Position] = []

  init() {
    self.populatePositions()

    // var pos = Position("D1")
    // print(self.getNeighboursOf(position: pos))
    self.placePiece(input: "A1", side: .First)
  }

  private func getOffset(of: Int) -> Int {
    switch of {
      case 1, 7: return 3
      case 2, 6: return 2
      case 3, 4, 5: return 1
      default: return 0;
    }
  }

  func getNeighboursOf(position: Position) -> [Position] {
    let offsetX = getOffset(of: position.y)
    let offsetY = getOffset(of: position.x)
    return positions.filter {
      ($0.x == position.x - offsetX || $0.x == position.x + offsetX || $0.x == position.x) &&
      ($0.y == position.y - offsetY || $0.y == position.y + offsetY || $0.y == position.y) &&
      !($0.y == position.y && $0.x == position.x)
    }
  }

  func placePiece(input: String, side: PlayerSide) {
    let position = Position(input)
    if let p = positions.first(where: { $0 == position }) {
      p.side = side
    } else {
      print("Invalid position")
    }
  }

  func isEmpty(input: String) -> Bool {
    let position = Position(input)
    return positions.first(where: { $0 == position })?.side == PlayerSide.None
  }

  func populatePositions() {
    let allPositions = [
      "A1", "D1", "G1",
      "B2", "D2", "F2",
      "C3", "D3", "E3",
      "A4", "B4", "C4", "E4", "F4", "G4",
      "C5", "D5", "E5",
      "B6", "D6", "F6",
      "A7", "D7", "G7",
    ]
    for p in allPositions {
      positions.append(Position(p))
    }
  }

  func printBoard() {
    let output = """
          A   B   C   D   E   F   H
      
      1   \(positions[0].symbol) - - - - - \(positions[1].symbol) - - - - - \(positions[2].symbol)
          |           |           |
      2   |   \(positions[3].symbol) - - - \(positions[4].symbol) - - - \(positions[5].symbol)   |
          |   |       |       |   |
      3   |   |   \(positions[6].symbol) - \(positions[7].symbol) - \(positions[8].symbol)   |   |
          |   |   |       |   |   |
      4   \(positions[9].symbol) - \(positions[10].symbol) - \(positions[11].symbol)       \(positions[12].symbol) - \(positions[13].symbol) - \(positions[14].symbol)
          |   |   |       |   |   |
      5   |   |   \(positions[15].symbol) - \(positions[16].symbol) - \(positions[17].symbol)   |   |
          |   |       |       |   |
      6   |   \(positions[18].symbol) - - - \(positions[19].symbol) - - - \(positions[20].symbol)   |
          |           |           |
      7   \(positions[21].symbol) - - - - - \(positions[22].symbol) - - - - - \(positions[23].symbol)
    """
    print(output)   
  }
}