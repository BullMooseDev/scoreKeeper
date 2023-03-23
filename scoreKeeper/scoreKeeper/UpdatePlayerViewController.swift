import UIKit

class UpdatePlayerViewController: UIViewController {
    
    @IBOutlet var playerNameInput: UITextField!
    @IBOutlet var playerScoreInput: UITextField!
    @IBOutlet var saveButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveButtonTapped(){
        guard let playerName = playerNameInput.text,
              let playerScore = playerScoreInput.text else { return }
        
        if playerName.isEmpty || playerScore.isEmpty { return }
        
//        basePlayers.append(Player(name: playerName, score: Int(playerScore)))
        
        // perform unwind on save and send new object data?
    }
}
