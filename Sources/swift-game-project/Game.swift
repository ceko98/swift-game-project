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
    printWinner()
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
    currentPlayer.placePiece()
    return gameBoard.placePiece(position: position, side: currentPlayer.side)
  }

  private func move() -> Position {
    var (from, to) = getValidPair()
    while !gameBoard.isEmpty(position: to) || (currentPlayer.canJump && gameBoard.isNeighbour(from: from, to: to)){
      print("Cannot move there")
      (from, to) = getValidPair()
    }
    let _ = gameBoard.placePiece(position: from, side: PlayerSide.None)
    return gameBoard.placePiece(position: to, side: currentPlayer.side)
  }

  private func remove() {
    let position = getValidPosition()
    let _ = gameBoard.placePiece(position: position, side: PlayerSide.None)
    previousPlayer.removePiece()
  }

  private func getValidPosition() -> Position {
    print("Write position")
    var input = readLine()!
    while !gameBoard.isValid(position: input) {
      print("Invalid position. Write new position:")
      input = readLine()!
    }
    return Position(input)
  }

  private func getValidPair() -> (Position, Position) {
    print("Write positions")
    var input = readLine()!
    var p1 = String(input.prefix(2))
    var p2 = String(input.suffix(2))
    while input.count != 4 || !gameBoard.isValid(position: p1) || !gameBoard.isValid(position: p2) {
      print("Invalid positions. Write new positions:")
      input = readLine()!
      p1 = String(input.prefix(2))
      p2 = String(input.suffix(2))
    }
    return (Position(p1), Position(p2))
  }

  private func gameEnded() -> Bool {
    return currentPlayer.totalPieces < 3
  }

  private func printWinner() {
    print("Winner: \(previousPlayer.side)")
  } 
}