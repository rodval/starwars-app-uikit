//
//  CharacterTableViewCell.swift
//  StarWars
//
//  Created by Rodrigo Valladares on 13/6/23.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    // MARK: outlets properties
    @IBOutlet weak var characterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setCellInformation(character: CharacterResponse) {
        characterLabel.text = character.title
    }
}
