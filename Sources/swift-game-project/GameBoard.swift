public class GameBoard {
  var positions: [Position] = []

  init() {
    self.populatePositions()
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
      positions.append(Position(position: p))
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