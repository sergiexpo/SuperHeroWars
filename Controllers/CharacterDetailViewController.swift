//
//  CharacterDetailViewController.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 24/2/21.
//

import UIKit


class CharacterDetailViewController: UIViewController{
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var tableViewCharacterDetail: UITableView!
    
    
    @IBAction func onBackPressed(_ sender: UIButton){
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func onAddPressed(_ sender: UIButton){
        
        if  !(DataManager.shared.isCharacterInTeam(characterId: character?.id)) {
            
            switch (character?.biography?.publisher) {
                
                case "DC Comics":
                    
                    if(UserDefaults.standard.string(forKey: keyValueDC1) == nil){
                        
                        DataManager.shared.addHeroToTeam(character: character, keyValue: keyValueDC1)                                 
                    } else if(UserDefaults.standard.string(forKey: keyValueDC2) == nil){
                        
                        DataManager.shared.addHeroToTeam(character: character, keyValue: keyValueDC2)
                        
                    }else if(UserDefaults.standard.string(forKey: keyValueDC3) == nil){
                        
                        DataManager.shared.addHeroToTeam(character: character, keyValue: keyValueDC3)
                        
                    } else {
                        
                        showAlert(style: .alert,
                                  title: "",
                                  message: NSLocalizedString("message_2_2_desc", comment: ""),
                                  onAccept: {action in
                                    self.navigationController?.popViewController(animated: true)
                                  })
                    }
                    
                default:
                    
                    if(UserDefaults.standard.string(forKey: keyValueMarvel1) == nil){
                        
                        DataManager.shared.addHeroToTeam(character: character, keyValue: keyValueMarvel1)
                        
                    } else if(UserDefaults.standard.string(forKey: keyValueMarvel2) == nil){
                        
                        DataManager.shared.addHeroToTeam(character: character, keyValue: keyValueMarvel2)
                        
                    }else if(UserDefaults.standard.string(forKey: keyValueMarvel3) == nil){
                        
                        DataManager.shared.addHeroToTeam(character: character, keyValue: keyValueMarvel3)
                        
                    } else {
                        
                        showAlert(style: .alert,
                                  title: "",
                                  message: NSLocalizedString("message_2_1_desc", comment: ""),
                                  onAccept: {action in
                                    self.navigationController?.popViewController(animated: true)
                                  })
                    }
                    
            }
            
        } else {
            
            showAlert(style: .alert,
                      title: "",
                      message: NSLocalizedString("message_6_desc", comment: ""),
                      onAccept: {action in
                        self.navigationController?.popViewController(animated: true)
                      })
        }
    }
    
    // MARK: - Properties
    //Parametrizar en preparefosegue
    var character: CharacterEntity? = nil
    
    //***** ViewModels ******
    var characterID: String?
    private let viewModel = CharacterDetailViewModel()
    //***** ViewModels ******
    
    // MARK: -Lifeccycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCharacterDetail.delegate = self
        tableViewCharacterDetail.dataSource = self
        
        //***** ViewModels ******
       /* viewModel.onViewConfigured(by: characterID){} */
        //***** ViewModels ******
    }
    
    
}


extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewCharacterDetail.dequeueReusableCell(withIdentifier: CharacterDetailViewCell().nameCell) as? CharacterDetailViewCell
        
        if let characterEntity = character{
        cell?.configure(CharacterDetailViewDataMapper.map(entity: characterEntity))
        }
            
         
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterDetailViewCell().heightCell
    }
    
    
    
}

