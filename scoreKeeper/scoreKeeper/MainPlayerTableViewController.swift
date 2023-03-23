import UIKit

protocol CellDelegate: AnyObject {
    func didSet( score: Int, for playerIndex: Int)
}

class MainPlayerTableViewController: UITableViewController, CellDelegate {
    
    func didSet(score: Int, for playerIndex: Int) {
        basePlayers[playerIndex].score = score
    }
    
    //IBAAction for steppper instead
    
    // array of players
    var basePlayers = [Player(name: "MJ", score: 10), Player(name: "Kole", score: 5), Player(name: "Jane", score: 50)]

    override func viewDidLoad() {
        super.viewDidLoad()
        // sorted array of players below ** likely will need to change here for adding/added players
        basePlayers.sort(by: { $0.score > $1.score })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basePlayers.count
    }
    
    // create cells for players to inhabit
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! PlayerCell
        
        let player = basePlayers[indexPath.row]
        
        cell.playerName.text = player.name
        cell.playerScore.text = String(player.score)
        cell.playerImage.image = UIImage(systemName: "person.crop.rectangle")
        
        return cell
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper){
        // call didset here?
    }
}
