import UIKit

protocol CellDelegate: AnyObject {
    func didSet(score: Int, for playerIndex: Int)
}

class MainPlayerTableViewController: UITableViewController, CellDelegate {
    
    func didSet(score: Int, for playerIndex: Int) {
        basePlayers[playerIndex].score = score
        tableView.reloadData()
    }
    
    // array of players below
    var basePlayers = [Player(name: "MJ", score: 10), Player(name: "Kole", score: 5), Player(name: "Jane", score: 50)]

    override func viewDidLoad() {
        super.viewDidLoad()
        // sorted array of players below ** likely will need to change here for adding/added players when update is called new sort will be needed
        basePlayers.sort(by: { $0.score > $1.score })
        // UIStepper.stepValue = 1.0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basePlayers.count
    }
    
    // create cells for players to inhabit
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! PlayerCell
        // casting required above for utilizing custom cell
        
        let player = basePlayers[indexPath.row]
        
        // using custom cell below
        cell.playerName.text = player.name
        cell.playerScore.text = String(player.score)
        cell.playerImage.image = UIImage(systemName: "person.crop.rectangle")
        
        cell.stepperOutlet.value = Double(player.score)
        
        cell.delegate = self
        cell.index = indexPath.row
        
        return cell
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper){
        // call didset for updating player score here?
        // didSet(score: Int(sender.value), for: <#T##Int#>)
       // print("stepper tapped at \()")
        tableView.reloadData()
        basePlayers.sort(by: { $0.score > $1.score })
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        if let vc = segue.source as? UpdatePlayerViewController, let player = vc.player {
            basePlayers.append(player)
            print(basePlayers)
            tableView.reloadData()
            basePlayers.sort(by: { $0.score > $1.score })
        }
    }
}
