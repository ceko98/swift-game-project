public class GameBoard {
  var positions: [Position] = []

  init() {
    self.populatePositions()
  }

  private func getOffset(of: Int) -> Int {
    switch of {
      case 1, 7: return 3
      case 2, 6: return 2
      case 3, 4, 5: return 1
      default: return 0;
    }
  }

  private func getNeighboursOf(position: Position) -> [Position] {
    let offsetX = getOffset(of: position.y)
    let offsetY = getOffset(of: position.x)
    return positions.filter {
      ($0.x == position.x - offsetX || $0.x == position.x + offsetX || $0.x == position.x) &&
      ($0.y == position.y - offsetY || $0.y == position.y + offsetY || $0.y == position.y) &&
      !($0.y == position.y && $0.x == position.x)
    }
  }

  func isNeighbour(from: Position, to: Position) -> Bool {
    return getNeighboursOf(position: from).contains(to)
  }

  func placePiece(position: Position, side: PlayerSide) {
    positions.first(where: { $0 == position })!.side = side
  }

  func hasMillAfter(position: Position, side: PlayerSide) -> Bool {
    var xPositions = positions.filter { $0.x == position.x }
    var yPositions = positions.filter { $0.y == position.y }

    if position.y == 4 {
      let side = position.x < 4 ? { (i: Int) -> Bool in i < 4 } : { (i: Int) -> Bool in i > 4 }
      xPositions = xPositions.filter { side($0.x) }
    }
    if position.x == 4 {
      let side = position.y < 4 ? { (i: Int) -> Bool in i < 4 } : { (i: Int) -> Bool in i > 4 }
      yPositions = yPositions.filter { side($0.x) }
    }

    return xPositions.allSatisfy({ $0.side == side }) || yPositions.allSatisfy({ $0.side == side })
  }

  func isEmpty(position: Position) -> Bool {
    return positions.first(where: { $0 == position })?.side == PlayerSide.None
  }

  func isValid(position: String) -> Bool {
    return getStringPositions().contains(position)
  }

  private func populatePositions() {
    for p in getStringPositions() {
      positions.append(Position(p))
    }
  }

  private func getStringPositions() -> [String] {
    return [
      "A1", "D1", "G1",
      "B2", "D2", "F2",
      "C3", "D3", "E3",
      "A4", "B4", "C4", "E4", "F4", "G4",
      "C5", "D5", "E5",
      "B6", "D6", "F6",
      "A7", "D7", "G7",
    ]
  }

  func printBoard() {
    let output = """
          A   B   C   D   E   F   G
      
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