import UIKit

class UpdatePlayerViewController: UIViewController {
    
    @IBOutlet var playerNameInput: UITextField!
    @IBOutlet var playerScoreInput: UITextField!
    @IBOutlet var saveButton: UIView!
    
    var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveButtonTapped(){
        guard let playerName = playerNameInput.text,
              let playerScore = playerScoreInput.text else { return }
        
        if playerName.isEmpty || playerScore.isEmpty { return }
        
        player = Player(name: playerName, score: Int(playerScore) ?? 0)
        
        performSegue(withIdentifier: "sendingPlayerUnwind", sender: self)
    }
}
