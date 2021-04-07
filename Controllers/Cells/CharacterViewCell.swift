//
//  CharacterViewCell.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 25/2/21.
//

import UIKit
import Kingfisher

class CharacterViewCell:UITableViewCell{
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var viewCellCharacter: UIView!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var imageViewCharacter: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageViewAlignment: UIImageView!
    
  
    @IBOutlet weak var stackViewAppearanceFirstRow:UIStackView!
    @IBOutlet weak var labelRace: UILabel!
    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var stackViewAppearanceSecondRow:UIStackView!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelWeight: UILabel!
    
    
    @IBOutlet weak var stackViewStats:UIStackView!
    
    @IBOutlet weak var stackViewINT:UIStackView!
    @IBOutlet weak var labelTitleINT: UILabel!
    @IBOutlet weak var progressViewINT: UIProgressView!
    @IBOutlet weak var labelValueINT: UILabel!
    
    @IBOutlet weak var stackViewSTR:UIStackView!
    @IBOutlet weak var labelTitleSTR: UILabel!
    @IBOutlet weak var progressViewSTR: UIProgressView!
    @IBOutlet weak var labelValueSTR: UILabel!
    
    @IBOutlet weak var stackViewSPE:UIStackView!
    @IBOutlet weak var labelTitleSPE: UILabel!
    @IBOutlet weak var progressViewSPE: UIProgressView!
    @IBOutlet weak var labelValueSPE: UILabel!
    
    @IBOutlet weak var stackViewDUR:UIStackView!
    @IBOutlet weak var labelTitleDUR: UILabel!
    @IBOutlet weak var progressViewDUR: UIProgressView!
    @IBOutlet weak var labelValueDUR: UILabel!
    
    @IBOutlet weak var stackViewPOW:UIStackView!
    @IBOutlet weak var labelTitlePOW: UILabel!
    @IBOutlet weak var progressViewPOW: UIProgressView!
    @IBOutlet weak var labelValuePOW: UILabel!
    
    @IBOutlet weak var stackViewCOM:UIStackView!
    @IBOutlet weak var labelTitleCOM: UILabel!
    @IBOutlet weak var progressViewCOM: UIProgressView!
    @IBOutlet weak var labelValueCOM: UILabel!
    
    @IBOutlet weak var stackViewAVE:UIStackView!
    @IBOutlet weak var labelTitleAVE: UILabel!
    @IBOutlet weak var progressViewAVE: UIProgressView!
    @IBOutlet weak var labelValueAVE: UILabel!
    
    // MARK: - Properties
    
    let heightCell: CGFloat = 284
    let nameCell: String = "CharacterViewCell"
    
    // MARK: -Lifeccycle functions
    
    override func prepareForReuse() {
        super.prepareForReuse()
                
        imageViewCharacter.image = nil
        imageViewAlignment.image = nil
        
        labelRace.text = nil
        labelHeight.text = nil
        labelGender.text = nil
        labelWeight.text = nil
        
        progressViewINT.progress = 0.0
        labelValueINT.text = nil
        
        progressViewSTR.progress = 0.0
        labelValueSTR.text = nil

        progressViewSPE.progress = 0.0
        labelValueSPE.text = nil

        progressViewDUR.progress = 0.0
        labelValueDUR.text = nil

        progressViewPOW.progress = 0.0
        labelValuePOW.text = nil

        progressViewCOM.progress = 0.0
        labelValueCOM.text = nil
                
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCellCharacter.layer.cornerRadius = 8.0
        viewBackground.layer.cornerRadius = 8.0
        imageBackground.layer.cornerRadius = 8.0
        
        
        labelTitleINT.text = NSLocalizedString("text_PS_INT", comment: "")
        labelTitleSTR.text = NSLocalizedString("text_PS_STR", comment: "")
        labelTitleSPE.text = NSLocalizedString("text_PS_SPE", comment: "")
        labelTitleDUR.text = NSLocalizedString("text_PS_DUR", comment: "")
        labelTitlePOW.text = NSLocalizedString("text_PS_POW", comment: "")
        labelTitleCOM.text = NSLocalizedString("text_PS_COM", comment: "")

        

   
        
    }
    
    
    func configure(_ data: CharacterViewData){
        
        let url = URL(string: data.imageCharacter ?? "")
        imageViewCharacter.kf.setImage(with: url)
        
        labelName.text = data.name
        
        switch data.alignment{
            
            case CharacterAlignment.good.rawValue:
                imageViewAlignment.image = UIImage(named: NSLocalizedString("text_image_good", comment: ""))
            case CharacterAlignment.bad.rawValue:
                imageViewAlignment.image = UIImage(named: NSLocalizedString("text_image_bad", comment: ""))
            case CharacterAlignment.neutral.rawValue:
                imageViewAlignment.image = UIImage(named: NSLocalizedString("text_image_neutral", comment: ""))
            default:
                break
        }
        
        
        labelRace.text = data.race
        labelGender.text = data.gender
        labelWeight.text = data.weight
        labelHeight.text = data.height
        labelValueINT.text = String(data.intelligence ?? 0)
        progressViewINT.progress = Float(data.intelligence ?? 0) / 100
        labelValueSTR.text = String(data.strength ?? 0)
        progressViewSTR.progress = Float(data.strength ?? 0) / 100
        labelValueSPE.text = String(data.speed ?? 0)
        progressViewSPE.progress = Float(data.speed ?? 0) / 100
        labelValueDUR.text = String(data.durability ?? 0)
        progressViewDUR.progress = Float(data.durability ?? 0) / 100
        labelValuePOW.text = String(data.power ?? 0)
        progressViewPOW.progress = Float(data.power ?? 0) / 100
        labelValueCOM.text = String(data.combat ?? 0)
        progressViewCOM.progress = Float(data.combat ?? 0) / 100
         
    }
    
    
    
    
}
