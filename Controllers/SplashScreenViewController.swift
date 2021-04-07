//
//  SplashScreenViewController.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 11/3/21.
//

import UIKit
import Lottie

class SplashScreenViewController: UIViewController {

    
    @IBOutlet weak var viewAnimation: UIView!
    
    private var progressBar: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if DataManager.shared.isCharactersDownloaded() {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "FROM_SPLASH_TO_MAIN", sender: nil)
            }
        } else {
            loadData()
        }
   }
    
    override func viewWillDisappear(_ animated: Bool) {
        DataManager.shared.loadCharacterObserver = nil
        super.viewWillDisappear(animated)
      }
    
    private func configureViews(){
        progressBar = .init(name: "progresscircle_color")
        progressBar?.frame = viewAnimation.bounds
        progressBar?.contentMode = .scaleAspectFit
        progressBar?.loopMode = .playOnce
        
        if let loadingAnimation = progressBar{
            viewAnimation.addSubview(loadingAnimation)
        }
    }
    
    private func loadData() {
        DataManager.shared.loadCharacterObserver = { [weak self] progress in
            self?.progressBar?.play(toProgress: CGFloat(progress))
            
            if progress >= 1 {
                self?.performSegue(withIdentifier: "FROM_SPLASH_TO_MAIN",
                                   sender: nil)
            }
        }
        
        DataManager.shared.downloadAllCharacters()
    }
}
