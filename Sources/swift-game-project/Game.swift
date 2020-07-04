class Game {
  private let gameBoard: GameBoard
  private var currentPlayer: Player
  private var previousPlayer: Player

  init() {
    gameBoard = GameBoard()
    currentPlayer = Player(.First)
    previousPlayer = Player(.Second)
  }

  func start() {
    while !gameEnded() {
      gameBoard.printBoard()
      playTurn()
      swap(&currentPlayer, &previousPlayer)
    }
  }

  private func playTurn() {
    var changedPosition: Position
    if (currentPlayer.hasToMove) {
      changedPosition = move()
    } else {
      changedPosition = place()
    }
    if gameBoard.hasMillAfter(position: changedPosition, side: currentPlayer.side) {
      gameBoard.printBoard()
      print("Remove piece")
      remove()
    }
  }

  private func place() -> Position {
    var position = getValidPosition()
    while !gameBoard.isEmpty(position: position) {
      print("Position already taken")
      position = getValidPosition()
    }
    gameBoard.placePiece(position: position, side: currentPlayer.side)
    currentPlayer.placePiece()
    return position
  }

  private func move() -> Position {
    var (from, to) = getValidPair()
    while !gameBoard.isEmpty(position: to) || (currentPlayer.canJump && gameBoard.isNeighbour(from: from, to: to)){
      print("Cannot move there")
      (from, to) = getValidPair()
    }
    gameBoard.placePiece(position: from, side: PlayerSide.None)
    gameBoard.placePiece(position: to, side: currentPlayer.side)
    return to
  }

  private func remove() {
    let position = getValidPosition()
    gameBoard.placePiece(position: position, side: PlayerSide.None)
    previousPlayer.removePiece()
  }

  private func getValidPosition() -> Position {
    var input = readLine()!
    while !gameBoard.isValid(position: input) {
      print("Invalid position")
      input = readLine()!
    }
    return Position(input)
  }

  private func getValidPair() -> (Position, Position) {
    var input = readLine()!
    var p1 = String(input.prefix(2))
    var p2 = String(input.suffix(2))
    while input.count != 4 || !gameBoard.isValid(position: p1) || !gameBoard.isValid(position: p2) {
      print("Invalid positions")
      input = readLine()!
      p1 = String(input.prefix(2))
      p2 = String(input.suffix(2))
    }
    return (Position(p1), Position(p2))
  }

  private func gameEnded() -> Bool {
    return currentPlayer.totalPieces <= 2 || previousPlayer.totalPieces <= 2
  }
}