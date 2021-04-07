//
//  CharactersDCComicsViewController.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 25/2/21.
//

import UIKit
//import DropDown

// Poner todos los textos en los ficheritos de los string

class CharactersDCComicsViewController: UIViewController{
    
    //MARK: - IBOutlets
    @IBOutlet weak var buttonSearch: UIButton!
    @IBOutlet weak var searchBarDC: UISearchBar!
    @IBOutlet weak var imageViewsearchBarDC: UIImageView!
    @IBOutlet weak var buttonFilter: UIButton!
    @IBOutlet weak var buttonRefreshDB: UIButton!
    @IBOutlet weak var imageViewDCComics: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var tableViewCharactersDCComics: UITableView!
    
    
    //MARK: - Variables
    
    private var defaultCharactersDCComics : [CharacterEntity] = []
    private var defaultDCComics: [CharacterEntity] {
        DataManager.shared.characters(by: .dCComics).sorted{ $0.name ?? "" < $1.name ?? "" }
    }
    
    //MARK: - IBActions
    @IBAction func onfilterPressed(_ sender: UIButton){
        
        showFilter(style: .actionSheet, title: NSLocalizedString("message_5_title", comment: ""), message: NSLocalizedString("message_5_desc", comment: ""),
                   filterAll:{action in
                    
                    self.defaultCharactersDCComics = self.defaultDCComics
                    self.tableViewCharactersDCComics.reloadData()
                    
                   },
                   filterGood:{action in
                    
                    self.defaultCharactersDCComics = DataManager.shared.filter(characters: self.defaultDCComics, by: CharacterAlignment.good.rawValue)
                    self.tableViewCharactersDCComics.reloadData()
                    
                   },
                   filterNeutral:{action in
                    
                    self.defaultCharactersDCComics = DataManager.shared.filter(characters: self.defaultDCComics, by: CharacterAlignment.neutral.rawValue)
                    self.tableViewCharactersDCComics.reloadData()
                    
                   },
                   filterBad:{action in
                    
                    self.defaultCharactersDCComics = DataManager.shared.filter(characters: self.defaultDCComics, by: CharacterAlignment.bad.rawValue)
                    self.tableViewCharactersDCComics.reloadData()
                    
                   }
        )
    }
    
    @IBAction func onSearchPressed(_ sender: UIButton){
        if searchBarDC.isHidden {
            searchBarDC.isHidden = false
            imageViewsearchBarDC.isHidden = false
        }else {
            searchBarDC.isHidden = true
            imageViewsearchBarDC.isHidden = true
        }
    }
    
    @IBAction func onRefreshPressed(_ sender: UIButton){
        DataManager.shared.removeDB()
        self.defaultCharactersDCComics = self.defaultDCComics
        self.tableViewCharactersDCComics.reloadData()
        UIApplication.shared.beginIgnoringInteractionEvents()
        DataManager.shared.loadCharactersCount = 0
        
        DataManager.shared.loadCharacterObserver = { [weak self] progress in
            if DataManager.shared.loadCharactersCount >= DataManager.shared.characterMaxCount - 1 {
                self?.defaultCharactersDCComics = self?.defaultDCComics ?? []
                self?.tableViewCharactersDCComics.reloadData()
                UIApplication.shared.endIgnoringInteractionEvents()
            }
        }
        DataManager.shared.downloadAllCharacters()
    }
    
    // MARK: -Lifeccycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultCharactersDCComics = defaultDCComics
        
        searchBarDC.isHidden = true
        searchBarDC.delegate = self
        
        imageViewsearchBarDC.isHidden = true
        
        tableViewCharactersDCComics.delegate = self
        tableViewCharactersDCComics.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        searchBarDC.isHidden = true
        imageViewsearchBarDC.isHidden = true
    }
    
    
    //MARK: -Segue functions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? CharacterDetailViewController,
              let cell = sender as? UITableViewCell,
              let indexPath = tableViewCharactersDCComics.indexPath(for: cell)
        else {
            return
        }
        if (indexPath.row < defaultCharactersDCComics.count){
            destination.character = defaultCharactersDCComics[indexPath.row]
            //***** ViewModels ******
            destination.characterID = defaultCharactersDCComics[indexPath.row].id
            //***** ViewModels ******
        }
    }
    
}


extension CharactersDCComicsViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return defaultCharactersDCComics.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewCharactersDCComics.dequeueReusableCell(withIdentifier: CharacterViewCell().nameCell) as? CharacterViewCell
        
        if (indexPath.row < defaultCharactersDCComics.count){
            
            let cellCharacter = defaultCharactersDCComics[indexPath.row]
            
            cell?.configure(CharacterViewDataMapper.map(entity: cellCharacter))
            
        }
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterViewCell().heightCell
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        defaultCharactersDCComics = []
        if searchText == "" {
            defaultCharactersDCComics = defaultDCComics
        }else{
            defaultDCComics.forEach{
                if ($0.name?.lowercased().starts(with: searchText.lowercased()) ?? false) {
                    defaultCharactersDCComics.append($0)
                }
            }
        }
        tableViewCharactersDCComics.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
    
    
}


