import UIKit

class GameOptionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var gameTitleTextEntry: UITextField!
    
    var playersList: [Player] = [Player(name: "kole", score: 5), Player(name: "alexis", score: 10), Player(name: "mj", score: 5), Player(name: "paige", score: 10), Player(name: "moe", score: 10), Player(name: "jane", score: 30), Player(name: "zane", score: 30)]
    
    var game: Games
    
    init?(coder: NSCoder, game: Games) {
        self.game = game
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.game = Games(gameTitle: "dice", sortedBy: true, winCondition: false)
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        // if game exists send it, if not build a new one
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
        
//        if game.players.contains( player for cell? ) {
//            cell.backgroundColor = .green
//        }
//              update view to reflect color change?
        
        return cell
    }
    
    
    @IBAction func sortedPlayersBy(_ sender: UISegmentedControl) {
        game.sortedBy = sender.selectedSegmentIndex == 0
    }
    
    @IBAction func winCondition(_ sender: UISegmentedControl) {
        game.winCondition = sender.selectedSegmentIndex == 0
    }
    
    
    @IBAction func gameTitleChanged(_ sender: UITextField) {
        game.gameTitle = sender.text ?? "dice"
        
        //add guard statement and maybe alert user to emtpy field
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard tableView.indexPathForSelectedRow != nil else { return }
        
        let player = playersList[indexPath.row]
        
        // check for player before adding? use sets?
        game.players.insert({player}())
    }
    
//    @IBAction func unwindToMainGameView(segue: UIStoryboardSegue) {
//        guard segue.identifier == "SaveGameUnwind",
//        let sourceViewController = segue.source as? GameOptionsViewController else { return }
//
//        if let selectedIndexPath = tableView.indexPathForSelectedRow {
//            gamesList[selectedIndexPath.row] = game
//            tableView.reloadRows(at: [selectedIndexPath], with: .fade)
//        } else {
//            let newIndexPath = IndexPath(row: gamesList.count, section: 0)
//            gamesList.append(game)
//            tableView.insertRows(at: [newIndexPath], with: .automatic)
//        }
//
//        print("unwind clicked")
//    }
}
