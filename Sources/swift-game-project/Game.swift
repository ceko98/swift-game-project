class Game {
  let gameBoard: GameBoard
  let player1: Player
  let player2: Player
  var currentPlayer: Player

  init() {
    gameBoard = GameBoard()
    player1 = Player(.First)
    player2 = Player(.Second)
    currentPlayer = player1
  }

  func start() {
    while !gameEnded() {
      
    }
  }

  var a: (Game) -> () -> Void = start

  func playTurn() {
    let position = getValidPosition()
    
  }

  func placeNew(position: String) {
    gameBoard.placePiece(position: Position(position), side: currentPlayer.side)
  }

  func getValidPosition() -> String {
    var input: String
    input = readLine()!
    while !gameBoard.isValid(position: input) {
      print("Invalid position")
      input = readLine()!
    }
    return input
  }

  func gameEnded() -> Bool {
    return player1.pieces <= 2 || player1.pieces <= 2
  }
}