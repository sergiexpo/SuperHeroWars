//
//  CharacterMarvelViewController.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 5/3/21.
//

import UIKit


class CharactersMarvelViewController: UIViewController{
    
    //MARK: - IBOutlets
    @IBOutlet weak var buttonSearch: UIButton!
    @IBOutlet weak var searchBarMarvel: UISearchBar!
    @IBOutlet weak var imageViewsearchBarMarvel: UIImageView!
    @IBOutlet weak var buttonFilter: UIButton!
    @IBOutlet weak var buttonRefreshDB: UIButton!
    @IBOutlet weak var imageViewMarvelComics: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var tableViewCharactersMarvel: UITableView!
    
    
    //MARK: - Variables
    
    private var defaultCharactersMarvel: [CharacterEntity] = []
    private var defaultMarvel: [CharacterEntity] {
        return DataManager.shared.characters(by: .marvel).sorted { $0.name ?? "" < $1.name ?? "" }
    }
    
    //MARK: - IBActions
    @IBAction func onfilterPressed(_ sender: UIButton) {
        
        showFilter(style: .actionSheet, title: NSLocalizedString("message_5_title", comment: ""), message: NSLocalizedString("message_5_desc", comment: ""),
                   filterAll:{action in
                    
                    self.defaultCharactersMarvel = self.defaultMarvel
                    self.tableViewCharactersMarvel.reloadData()
                    
                   },
                   filterGood:{action in

                    self.defaultCharactersMarvel = DataManager.shared.filter(characters: self.defaultMarvel, by: CharacterAlignment.good.rawValue)
                    self.tableViewCharactersMarvel.reloadData()
                    
                   },
                   filterNeutral:{action in
                    
                    self.defaultCharactersMarvel = DataManager.shared.filter(characters: self.defaultMarvel, by: CharacterAlignment.neutral.rawValue)
                    self.tableViewCharactersMarvel.reloadData()
                    
                   },
                   filterBad:{action in
                    
                    self.defaultCharactersMarvel = DataManager.shared.filter(characters: self.defaultMarvel, by: CharacterAlignment.bad.rawValue)
                    self.tableViewCharactersMarvel.reloadData()
                    
                   }
        )
        
        
    }
    
    @IBAction func onSearchPressed(_ sender: UIButton){
        if searchBarMarvel.isHidden {
            searchBarMarvel.isHidden = false
            imageViewsearchBarMarvel.isHidden = false
        }else {
            searchBarMarvel.isHidden = true
            imageViewsearchBarMarvel.isHidden = true
        }
    }
    
    @IBAction func onRefreshPressed(_ sender: UIButton) {
        DataManager.shared.removeDB()
        self.defaultCharactersMarvel = self.defaultMarvel
        self.tableViewCharactersMarvel.reloadData()
        UIApplication.shared.beginIgnoringInteractionEvents()
        DataManager.shared.loadCharactersCount = 0
        
        DataManager.shared.loadCharacterObserver = { [weak self] progress in
            if DataManager.shared.loadCharactersCount >= DataManager.shared.characterMaxCount - 1 {
                self?.defaultCharactersMarvel = self?.defaultMarvel ?? []
                self?.tableViewCharactersMarvel.reloadData()
                UIApplication.shared.endIgnoringInteractionEvents()
            }
        }
        DataManager.shared.downloadAllCharacters()
    }
    
    
    // MARK: -Lifeccycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultCharactersMarvel = defaultMarvel
        
        searchBarMarvel.isHidden = true
        searchBarMarvel.delegate = self
        
        imageViewsearchBarMarvel.isHidden = true
        
        tableViewCharactersMarvel.delegate = self
        tableViewCharactersMarvel.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        searchBarMarvel.isHidden = true
        imageViewsearchBarMarvel.isHidden = true
    }
    
    
    //MARK: -Segue functions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? CharacterDetailViewController,
              let cell = sender as? UITableViewCell,
              let indexPath = tableViewCharactersMarvel.indexPath(for: cell)
        else {
            return
        }
        if (indexPath.row < defaultCharactersMarvel.count){
            destination.character = defaultCharactersMarvel[indexPath.row]
            //***** ViewModels ******
            destination.characterID = defaultCharactersMarvel[indexPath.row].id
            //***** ViewModels ******
        }
    }
    
}


extension CharactersMarvelViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return defaultCharactersMarvel.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewCharactersMarvel.dequeueReusableCell(withIdentifier: CharacterViewCell().nameCell) as? CharacterViewCell
        
        if (indexPath.row < defaultCharactersMarvel.count){
            
            let cellCharacter = defaultCharactersMarvel[indexPath.row]
            
            cell?.configure(CharacterViewDataMapper.map(entity: cellCharacter))
            
        }
        return cell ?? UITableViewCell()
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterViewCell().heightCell
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        defaultCharactersMarvel = []
        if searchText == "" { // Utilizar el isEmpty en lugar de compara con vacío
            defaultCharactersMarvel = defaultMarvel
        }else{
            defaultMarvel.forEach{
                if ($0.name?.lowercased().starts(with: searchText.lowercased()) ?? false) {
                    defaultCharactersMarvel.append($0)
                }
            }
        }
        tableViewCharactersMarvel.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
    
    
    
}

