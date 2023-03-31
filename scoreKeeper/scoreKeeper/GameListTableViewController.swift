import UIKit

var gamesList: [Games] = [Games(gameTitle: "dice", sortedBy: true, winCondition: false, players: [Player(name: "david", score: 20), Player(name: "joshua", score: 15)])]

class GameListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameCell
        
        let games = gamesList[indexPath.row]

        cell.gameImage.image = UIImage(systemName: "dice.fill")
        cell.gameTitle.text = String(games.gameTitle)
        cell.gameScore.text = String(games.players.count)

        return cell
    }
    
    
    @IBSegueAction func addGame(_ coder: NSCoder) -> GameOptionsViewController? {
        return GameOptionsViewController(coder: coder)
    }
    
    
    @IBSegueAction func gamePlayersEdit(_ coder: NSCoder, sender: Any?) -> MainPlayerTableViewController? {
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else { fatalError("busted")}
        
        let vc = MainPlayerTableViewController(coder: coder)
        
        vc?.basePlayers = Array(gamesList[indexPath.row].players)
        
        return vc
    }
    
    @IBAction func unwindToMainGameView(segue: UIStoryboardSegue) {
        guard segue.identifier == "SaveGameUnwind",
        let sourceViewController = segue.source as? GameOptionsViewController else { return }

        let game = sourceViewController.game
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
           gamesList[selectedIndexPath.row] = game
            tableView.reloadRows(at: [selectedIndexPath], with: .fade)
        } else {
            let newIndexPath = IndexPath(row: gamesList.count, section: 0)
           gamesList.append(game)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        // update game option as well from here
    }
}
