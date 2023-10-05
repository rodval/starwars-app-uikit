//
//  CharacterDetailTableViewCell.swift
//  StarWars
//
//  Created by Rodrigo Valladares on 16/6/23.
//

import UIKit

class CharacterDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setCellInformation(character: CharacterResponse) {
        characterDescriptionLabel.text = character.description
        characterImage.downloadImage(at: character.image ?? "")
    }
}
