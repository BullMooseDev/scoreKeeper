import UIKit

class PlayerCell: UITableViewCell {
    
    @IBOutlet var playerImage: UIImageView!
    @IBOutlet var playerName: UILabel!
    @IBOutlet var playerScore: UILabel!
    @IBOutlet var stepperOutlet: UIStepper!
    
    weak var delegate: CellDelegate?
    
    var index: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func stepperAction(_ sender: Any) {
        guard let index = index else { return }
        
        delegate?.didSet(score: Int(stepperOutlet.value), for: index)
    }
}
