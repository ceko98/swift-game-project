class Game {
  let gameBoard: GameBoard
  let player1: Player
  let player2: Player
  var currentPlayer: Player
  var previousPlayer: Player

  init() {
    gameBoard = GameBoard()
    player1 = Player(.First)
    player2 = Player(.Second)
    currentPlayer = player1
    previousPlayer = player2
  }

  func start() {
    while !gameEnded() {
      gameBoard.printBoard()
      playTurn()
      swap(&currentPlayer, &previousPlayer)
    }
  }

  func playTurn() {
    if (currentPlayer.hasToMove) {

    } else {
      placeNew()
    }
  }

  func placeNew() {
    var position = Position(getValidPosition())
    while !gameBoard.isEmpty(position: position) {
      print("Position already taken")
      position = Position(getValidPosition())
    }
    gameBoard.placePiece(position: position, side: currentPlayer.side)
    currentPlayer.placePiece()
  }

  func getValidPosition() -> String {
    var input = readLine()!
    while !gameBoard.isValid(position: input) {
      print("Invalid position")
      input = readLine()!
    }
    return input
  }

  func gameEnded() -> Bool {
    return player1.totalPieces <= 2 || player1.totalPieces <= 2
  }
}