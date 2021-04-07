//
//  CharacterDetailViewCell.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 24/2/21.
//

import UIKit

class CharacterDetailViewCell:UITableViewCell{
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var viewCellCharacterDetail: UIView!
    @IBOutlet weak var viewAlignmentNamePower: UIView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var viewPowerAverage: UIView!
    @IBOutlet weak var labelPowerAverage: UILabel!
    @IBOutlet weak var imageViewAlignment: UIImageView!
    @IBOutlet weak var imageViewCharacter: UIImageView!
    
    @IBOutlet weak var viewINT: UIView!
    @IBOutlet weak var stackViewINT:UIStackView!
    @IBOutlet weak var labelValueINT: UILabel!
    @IBOutlet weak var labelDescpritionINT: UILabel!
    
    @IBOutlet weak var viewSTR: UIView!
    @IBOutlet weak var stackViewSTR:UIStackView!
    @IBOutlet weak var labelValueSTR: UILabel!
    @IBOutlet weak var labelDescpritionSTR: UILabel!
    
    @IBOutlet weak var viewSPE: UIView!
    @IBOutlet weak var stackViewSPE:UIStackView!
    @IBOutlet weak var labelValueSPE: UILabel!
    @IBOutlet weak var labelDescpritionSPE: UILabel!
    
    @IBOutlet weak var viewDUR: UIView!
    @IBOutlet weak var stackViewDUR:UIStackView!
    @IBOutlet weak var labelValueDUR: UILabel!
    @IBOutlet weak var labelDescpritionDUR: UILabel!
    
    @IBOutlet weak var viewPOW: UIView!
    @IBOutlet weak var stackViewPOW:UIStackView!
    @IBOutlet weak var labelValuePOW: UILabel!
    @IBOutlet weak var labelDescpritionPOW: UILabel!
    
    @IBOutlet weak var viewCOM: UIView!
    @IBOutlet weak var stackViewCOM:UIStackView!
    @IBOutlet weak var labelValueCOM: UILabel!
    @IBOutlet weak var labelDescpritionCOM: UILabel!
    
    @IBOutlet weak var labelRace: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelPublisher: UILabel!
    @IBOutlet weak var labelFullName: UILabel!
    
    @IBOutlet weak var viewBiography: UIView!
    @IBOutlet weak var labelBiography: UILabel!
    
    @IBOutlet weak var stackViewPlaceOfBirth:UIStackView!
    @IBOutlet weak var labelTitlePlaceOfBirth: UILabel!
    @IBOutlet weak var labelDescpritionPlaceOfBirth: UILabel!
    
    @IBOutlet weak var stackViewFirstAppearance:UIStackView!
    @IBOutlet weak var labelTitleFirstAppearance: UILabel!
    @IBOutlet weak var labelDescpritionFirstAppearance: UILabel!
    
    @IBOutlet weak var stackViewBase:UIStackView!
    @IBOutlet weak var labelTitleBase: UILabel!
    @IBOutlet weak var labelDescpritionBase: UILabel!
    
    @IBOutlet weak var stackViewOcupation:UIStackView!
    @IBOutlet weak var labelTitleOcupation: UILabel!
    @IBOutlet weak var labelDescpritionOcupation: UILabel!
    
    @IBOutlet weak var stackViewGroupAffiliation:UIStackView!
    @IBOutlet weak var labelTitleGroupAffiliation: UILabel!
    @IBOutlet weak var labelDescpritionGroupAffiliation: UILabel!
    
    @IBOutlet weak var buttonSelect: UIButton!
    
    // MARK: - Properties
    
    let heightCell: CGFloat = 1600
    let nameCell: String = "CharacterDetailViewCell"
    
    // MARK: -Lifeccycle functions
    
    override func prepareForReuse() {
        super.prepareForReuse()
        labelName.text = nil
        labelPowerAverage.text = nil
        imageViewAlignment.image = nil
        imageViewCharacter.image = nil
        labelValueINT.text = nil
        labelValueSTR.text = nil
        labelValueSPE.text = nil
        labelValueDUR.text = nil
        labelValuePOW.text = nil
        labelValueCOM.text = nil
        labelRace.text = nil
        labelGender.text = nil
        labelPublisher.text = nil
        labelFullName.text = nil
        labelDescpritionPlaceOfBirth.text = nil
        labelDescpritionFirstAppearance.text = nil
        labelDescpritionBase.text = nil
        labelDescpritionOcupation.text = nil
        labelDescpritionGroupAffiliation.text = nil
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        viewPowerAverage.layer.cornerRadius = 24.0
        viewPowerAverage.layer.maskedCorners = [ .layerMinXMaxYCorner]
        
        imageViewAlignment.layer.cornerRadius = 24.0
        imageViewAlignment.layer.maskedCorners = [ .layerMaxXMaxYCorner]
        
        viewINT.roundOut()
        stackViewINT.roundOut()
       
        viewSTR.roundOut()
        stackViewSTR.roundOut()
        
        viewSPE.roundOut()
        stackViewSPE.roundOut()
        
        viewDUR.roundOut()
        stackViewDUR.roundOut()
        
        viewPOW.roundOut()
        stackViewPOW.roundOut()
        
        viewCOM.roundOut()
        stackViewCOM.roundOut()
    
        labelDescpritionINT.text = NSLocalizedString("text_short_PS_INT", comment: "")
        labelDescpritionSTR.text = NSLocalizedString("text_short_PS_STR", comment: "")
        labelDescpritionSPE.text = NSLocalizedString("text_short_PS_SPE", comment: "")
        labelDescpritionDUR.text = NSLocalizedString("text_short_PS_DUR", comment: "")
        labelDescpritionPOW.text = NSLocalizedString("text_short_PS_POW", comment: "")
        labelDescpritionCOM.text = NSLocalizedString("text_short_PS_COM", comment: "")
        
        viewBiography.layer.borderWidth = 1.0
        
        stackViewPlaceOfBirth.layer.borderWidth = 1.0
        stackViewPlaceOfBirth.layer.borderColor = .init(red: 246.0/255.0, green: 144.0/255.0, blue: 78.0/255.0, alpha: 1.0)
   
        stackViewBase.layer.borderWidth = 1.0
        stackViewBase.layer.borderColor = .init(red: 246.0/255.0, green: 144.0/255.0, blue: 78.0/255.0, alpha: 1.0)
  
        stackViewGroupAffiliation.layer.borderWidth = 1.0
        stackViewGroupAffiliation.layer.borderColor = .init(red: 246.0/255.0, green: 144.0/255.0, blue: 78.0/255.0, alpha: 1.0)
        
        
        stackViewPlaceOfBirth.paddingInBiograpghy()
        stackViewFirstAppearance.paddingInBiograpghy()
        stackViewBase.paddingInBiograpghy()
        stackViewOcupation.paddingInBiograpghy()
        stackViewGroupAffiliation.paddingInBiograpghy()
        
    
        
        labelBiography.text = NSLocalizedString("text_Biography", comment: "")
        labelTitlePlaceOfBirth.text = NSLocalizedString("text_Place_of_Birth", comment: "")
        labelTitleFirstAppearance.text = NSLocalizedString("text_First_Appearance", comment: "")
        labelTitleBase.text = NSLocalizedString("text_Base", comment: "")
        labelTitleOcupation.text = NSLocalizedString("text_Ocupation", comment: "")
        labelTitleGroupAffiliation.text = NSLocalizedString("text_Group_Affiliation", comment: "")
        
        
        
    }
    
    func configure(_ data: CharacterDetailViewData){
        
        
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

        labelPowerAverage.text = String(data.averagePower ?? 0)
        
        labelValueINT.text = String(data.intelligence ?? 0)
        labelValueSTR.text = String(data.strength ?? 0)
        labelValueSPE.text = String(data.speed ?? 0)
        labelValueDUR.text = String(data.durability ?? 0)
        labelValuePOW.text = String(data.power ?? 0)
        labelValueCOM.text = String(data.combat ?? 0)
        
        self.setProgressCircleBar(frameAnimationview: viewINT, endFrame: CGFloat(data.intelligence ?? 0) * 9)
        self.setProgressCircleBar(frameAnimationview: viewSTR, endFrame: CGFloat(data.strength ?? 0) * 9)
        self.setProgressCircleBar(frameAnimationview: viewSPE, endFrame: CGFloat(data.speed ?? 0) * 9)
        self.setProgressCircleBar(frameAnimationview: viewDUR, endFrame: CGFloat(data.durability ?? 0) * 9)
        self.setProgressCircleBar(frameAnimationview: viewPOW, endFrame: CGFloat(data.power ?? 0) * 9)
        self.setProgressCircleBar(frameAnimationview: viewCOM, endFrame: CGFloat(data.combat ?? 0) * 9)
             
        labelRace.text = data.race
        labelGender.text = data.gender
        labelPublisher.text = data.publisher
        labelFullName.text = data.fullName
        
        labelDescpritionPlaceOfBirth.text = data.placeOfBirth
        labelDescpritionFirstAppearance.text = data.firstAppearance
        labelDescpritionBase.text = data.base
        labelDescpritionOcupation.text = data.ocupation
        labelDescpritionGroupAffiliation.text = data.groupAffiliation
        
    }
    
    
    
}

