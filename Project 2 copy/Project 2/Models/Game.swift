import Foundation


class Game {
    private var countries: [Country] = [
        Country(name: "estonia"),
        Country(name: "us"),
        Country(name: "uk"),
        Country(name: "germany"),
        Country(name: "italy"),
        Country(name: "france"),
        Country(name: "ireland"),
        Country(name: "spain"),
        Country(name: "nigeria"),
        Country(name: "poland"),
        Country(name: "russia"),
        Country(name: "monaco")
    ]
    
    private var correctAnswer: Int = 0
    var score: Int = 0
    
    func incrementScore() {
        score += 1
    }
    
    func decrementScore() {
        score -= 1
    }
    
    
    func setCorrectAnswer(_ correctAnswer: Int) {
        self.correctAnswer = correctAnswer
    }
    
    func askQuestion() -> [Country] {
        countries.shuffle()
        let randomIndex: Int = Int.random(in: 0..<3)
        setCorrectAnswer(randomIndex)
        return Array(countries.prefix(3))
    }
    
    func getCorrectAnswerName() -> String {
        return countries[correctAnswer].name
    }
    
    func getCountryName(_ index: Int) -> String {
        return countries[index].name
    }
    
    func checkAnswer(_ userAnswer: Int) -> () {
        let isCorrect = userAnswer == correctAnswer
        if isCorrect {
            incrementScore()
            return
        }
            decrementScore()
    }
}
