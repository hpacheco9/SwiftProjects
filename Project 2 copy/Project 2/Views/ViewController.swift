import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet private var button1: UIButton!
    @IBOutlet private var button2: UIButton!
    @IBOutlet private var button3: UIButton!
    
    private var gameViewModel: GameViewModel!
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        gameViewModel = GameViewModel()
        
        updateButtons()
        
        gameViewModel.$countryNames
            .sink { [weak self] countryNames in
                self?.updateButtons()
            }.store(in: &cancellables)
        
        gameViewModel.$score
            .sink { [weak self] score in
                self?.updateButtons()
            }
            .store(in: &cancellables)
        
        gameViewModel.$correctAnswer
            .sink { [weak self] correctAnswer in
                self?.title = correctAnswer
            }
            .store(in: &cancellables)
        
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.hidesBackButton = true
        
        
        
    }
    
    @IBAction private func buttonTapped(_ sender: UIButton) {

        gameViewModel.checkAnswer(userAnswer: sender.tag)
    
        if gameViewModel.score >= 5 {
            navigateToFinalScreen()
            return
        }
        
        updateButtons()
    }

    
     func updateButtons() {
        button1.setImage(UIImage(named: gameViewModel.countryNames[0]), for: .normal)
        button2.setImage(UIImage(named: gameViewModel.countryNames[1]), for: .normal)
        button3.setImage(UIImage(named: gameViewModel.countryNames[2]), for: .normal)
    }
    
     func navigateToFinalScreen() {
        if let finalViewController = storyboard?.instantiateViewController(withIdentifier: "Final") as? FinalViewController {
            finalViewController.scoreValue = gameViewModel.score
            navigationController?.pushViewController(finalViewController, animated: true)
        }
    }
}
