//
//  BattleViewController.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 3/3/21.
//

import UIKit

class BattleViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var imageViewMarvel: UIImageView!
    @IBOutlet weak var imageViewDCComics: UIImageView!
    @IBOutlet weak var tableViewBattleMarvelTeam: UITableView!
    @IBOutlet weak var tableViewBattleDCComicsTeam: UITableView!
    @IBOutlet weak var buttonFight: UIButton!
    
    //MARK: - IBACtions
    
    @IBAction func onAFightPressed(_ sender: UIButton){
        
        
        if UserDefaults.standard.string(forKey: keyValueDC1) == nil || UserDefaults.standard.string(forKey: keyValueMarvel3) == nil {
            
            showAlert(style: .alert,
                      title: NSLocalizedString("message_1_title", comment: ""),
                      message: NSLocalizedString("message_1_desc", comment: ""),
                      onAccept: {action in
                        self.navigationController?.popViewController(animated: true)
                      })
            
        }else{
            
            let winnerTeam = DataManager.shared.battle(marvel: fightTeamMarvel, dcComics: fightTeamDCComics)
            
            showResultFight(style: .alert,
                            title: NSLocalizedString("message_3_title", comment: ""),
                            message: winnerTeam + NSLocalizedString("message_3_desc", comment: ""),
                            onAccept: { action in
                                DataManager.shared.resetCharactersBattle()
                                self.viewWillAppear(true)
                            })
            
            
        }
        
        
        
    }
    
    //MARK: - Variables
    var fightTeamDCComics: [CharacterEntity?] = []
    var fightTeamMarvel: [CharacterEntity?] = []
    
    
    // MARK: -Lifeccycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewMarvel.layer.cornerRadius = 8.0
        imageViewDCComics.layer.cornerRadius = 8.0
        
        tableViewBattleMarvelTeam.delegate = self
        tableViewBattleMarvelTeam.dataSource = self
        
        tableViewBattleDCComicsTeam.delegate = self
        tableViewBattleDCComicsTeam.dataSource = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        fightTeamDCComics.removeAll()
        fightTeamMarvel.removeAll()
        
        let fighterDC1 = DataManager.shared.getCharacterFromTeam(keyValue: keyValueDC1)
        fightTeamDCComics.append(fighterDC1)
        
        let fighterDC2 = DataManager.shared.getCharacterFromTeam(keyValue: keyValueDC2)
        fightTeamDCComics.append(fighterDC2)
        
        let fighterDC3 = DataManager.shared.getCharacterFromTeam(keyValue: keyValueDC3)
        fightTeamDCComics.append(fighterDC3)
        
        let fighterM1 = DataManager.shared.getCharacterFromTeam(keyValue: keyValueMarvel1)
        fightTeamMarvel.append(fighterM1)
        
        let fighterM2 = DataManager.shared.getCharacterFromTeam(keyValue: keyValueMarvel2)
        fightTeamMarvel.append(fighterM2)
        
        let fighterM3 = DataManager.shared.getCharacterFromTeam(keyValue: keyValueMarvel3)
        fightTeamMarvel.append(fighterM3)
        
        
        tableViewBattleMarvelTeam.reloadData()
        tableViewBattleDCComicsTeam.reloadData()
        
    }
    

    
}




extension BattleViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numberFightersPerTeam //Posible Mejora: parametrizar el teamNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // El tableview viene como parametro, por lo tanto, podemos diferenciar los casos
        
        switch tableView{
            
            case tableViewBattleMarvelTeam:
                
                let cell = tableViewBattleMarvelTeam.dequeueReusableCell(withIdentifier: CharacterBattleViewCell().nameCell) as? CharacterBattleViewCell
                
                if indexPath.row < fightTeamMarvel.count {
                    cell?.configure(CharacterBattleViewDataMapper.map(entity: fightTeamMarvel[indexPath.row]),
                                    delegate: self)
                } else {
                    cell?.configure(nil,
                                    delegate: self)
                }
                return cell ?? UITableViewCell()
                
                
            case tableViewBattleDCComicsTeam:
                
                let cell = tableViewBattleDCComicsTeam.dequeueReusableCell(withIdentifier: CharacterBattleViewCell().nameCell) as? CharacterBattleViewCell
                
                if indexPath.row < fightTeamDCComics.count {
                    cell?.configure(CharacterBattleViewDataMapper.map(entity: fightTeamDCComics[indexPath.row]),
                                    delegate: self)
                } else {
                    cell?.configure(nil,
                                    delegate: self)
                }
                return cell ?? UITableViewCell()
                
                
            default:
                return UITableViewCell()
        }        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterBattleViewCell().heightCell
    }
}

extension BattleViewController: CharacterBattleViewCellProtocol {
    
    func onDeletePressed(characterId: String?) {
        keyValues.forEach{ keyValue in
            let fighter = DataManager.shared.getCharacterFromTeam(keyValue: keyValue)
            if fighter?.id == characterId {
                UserDefaults.standard.removeObject(forKey: keyValue)
            }
        }
        
        self.viewWillAppear(true)
    }
}
