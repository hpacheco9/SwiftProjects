import Foundation
import Combine

class GameViewModel: ObservableObject {
    @Published var score: Int = 0
    @Published var correctAnswer: String = ""
    @Published var countryNames: [String] = []
    
    private var game: Game = Game()
    
    init() {
        askQuestion()
    }
    
    func askQuestion() {
        let countries = game.askQuestion() 
        countryNames = countries.map { $0.name }
        correctAnswer = game.getCorrectAnswerName()
    }
    
    func checkAnswer(userAnswer: Int) {
        game.checkAnswer(userAnswer)
        score = game.score
        askQuestion()
    
    }
}
