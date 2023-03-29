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
    
    
    @IBSegueAction func gameEdit(_ coder: NSCoder, sender: Any?) -> GameOptionsViewController? {
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else { fatalError("busted")}
        
        return GameOptionsViewController(coder: coder, game: gamesList[indexPath.row])
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
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
