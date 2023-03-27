import UIKit

class GameOptionsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var playersList: [Player] = [Player(name: "kole", score: 5), Player(name: "alexis", score: 10), Player(name: "mj", score: 5), Player(name: "paige", score: 10), Player(name: "moe", score: 10), Player(name: "jane", score: 30), Player(name: "zane", score: 30)]
    
    override func viewDidLoad() {
        // add anything here?
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Players"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        playersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MinimalPlayerCell", for: indexPath) as! MinimalPlayerCell
        
        let players = playersList[indexPath.row]

        cell.playerImage.image = UIImage(systemName: "dice.fill")
        cell.playerNameLabel.text = players.name
        
        return cell
    }
}
