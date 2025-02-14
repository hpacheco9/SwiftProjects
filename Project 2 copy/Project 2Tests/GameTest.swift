import XCTest

final class GameTest: XCTestCase {
    
    var game: Game!
    func testIncrementScore() {
        for _ in 1...5 {
            game.incrementScore()
        }
        XCTAssertEqual(game.getScore(), 5)
    }
    
    func testDecrementScore() {
        for _ in 1...5 {
            game.decrementScore()
        }
        XCTAssertEqual(game.getScore(), -5)
    }
}
