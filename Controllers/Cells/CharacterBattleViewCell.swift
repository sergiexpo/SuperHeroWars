//
//  CharacterBattleViewCell.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 3/3/21.
//

import UIKit

protocol CharacterBattleViewCellProtocol {
    func onDeletePressed(characterId: String?)
}

class CharacterBattleViewCell: UITableViewCell{
    
    //MARK: - IBOutlets
    @IBOutlet weak var viewCellCharacterBattle: UIView!
    @IBOutlet weak var viewBack: UIView!
    @IBOutlet weak var imageViewCharacterBattle: UIImageView!
    @IBOutlet weak var labelNameCharacterBattle: UILabel!
    @IBOutlet weak var buttonRemove: UIButton!
    
    @IBAction func onRemovePressed(_ sender: UIButton){
        delegate?.onDeletePressed(characterId: characterId)

    }
    
    // MARK: - Properties
    let heightCell: CGFloat = 160
    let nameCell: String = "CharacterBattleViewCell"
    
    
    private var characterId: String?
    private var delegate: CharacterBattleViewCellProtocol?
    
    
    // MARK: -Lifeccycle functions
    override func prepareForReuse() {
        super.prepareForReuse()
        
        characterId = nil
        delegate = nil
        
        imageViewCharacterBattle.image = nil
        labelNameCharacterBattle.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewCharacterBattle.roundOut()
        viewBack.layer.cornerRadius = 8.0
        labelNameCharacterBattle.text = NSLocalizedString("message_4_desc", comment: "")
        
    }
    
    
    func configure(_ data: CharacterBattleViewData?,
                   delegate: CharacterBattleViewCellProtocol?) {
        
        let url = URL(string: data?.imageCharacter ?? "")
        imageViewCharacterBattle.kf.setImage(with: url)
        labelNameCharacterBattle.text = data?.name ?? NSLocalizedString("message_4_desc", comment: "")
        self.delegate = delegate
        self.characterId = data?.id
        self.buttonRemove.isHidden = data == nil ? true : false
    }
        
}
