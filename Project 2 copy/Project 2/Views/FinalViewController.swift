//
//  FinalViewController.swift
//  Project 2
//
//  Created by Henrique Pacheco on 13/02/2025.
//

import UIKit

class FinalViewController: UIViewController {
    @IBOutlet var score: UILabel!
    @IBOutlet var back: UIButton!
    var scoreValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        score.text = "Score: \(scoreValue)"
        score.font = UIFont.systemFont(ofSize: 36, weight: .light)
        back.configuration?.title = "Play again"
        back.configuration?.baseBackgroundColor = .black
        back.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
    
        title = "You won"
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func tapped(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Main") as? ViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
