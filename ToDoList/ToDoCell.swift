//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Natalie Blando Demarco on 6/6/25.
//

import UIKit

protocol ToDoCellDelegate: AnyObject {
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {


    weak var delegate: ToDoCellDelegate?
    
    @IBOutlet var checkMarkStatic: UIButton!
    @IBOutlet var toDoTitle: UILabel!
    
    @IBAction func checkMarkStaticTapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
