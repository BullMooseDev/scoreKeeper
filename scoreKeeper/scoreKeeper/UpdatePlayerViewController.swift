import UIKit

class UpdatePlayerViewController: UIViewController {
    
    @IBOutlet var playerNameInput: UITextField!
    @IBOutlet var playerScoreInput: UITextField!
    @IBOutlet var saveButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func addPlayer(){
        // when save button is clicked grab info from name and score and create a person object with it and append it into the player array, also perform unwind back onto table view
    }
}
