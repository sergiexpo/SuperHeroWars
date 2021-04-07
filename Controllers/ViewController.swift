//
//  ViewController.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 23/2/21.
//

import UIKit
import Lottie
import CoreLocation //Ubicacion
import MapKit       //Ubicacion

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var viewTest: UIView!
    @IBOutlet weak var labelTest: UILabel!
    @IBOutlet weak var labelTest2: UILabel!
    @IBOutlet weak var  map: MKMapView!
    
    private var locationManager:CLLocationManager?
    
    var DC1: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Para las traducciones!!!
        // Poner todos los textos en los ficheritos de los string
        let saludo = NSLocalizedString("text_hello", comment: "")
        self.setProgressCircleBar(frameAnimationview: viewTest, endFrame: 200)
        
        /*   labelTest.text = "Test: "  +
         "Reales: " + String(defaultCharacters.count) + "\n" + "Reales DC: " + String(defaultDCComics.count) + "\n" + "Reales Marvel: " + String(defaultMarvel.count)
         + "\n" + "\n" */
        
        /*    labelTest2.text =
         String(FighterDC1 ?? 0) + "\n" + String(FighterDC2 ?? 0) + "\n" + String(FighterDC3 ?? 0) + "\n" */
        
        
        updateUserLocation()
        
        
   /*     ApiService.shared.fetchHero(by: "20"){ result in
            switch result{
                case .success(let data):
                    guard let character = data as? CharacterHero else {
                        return
                    }
                    // print (character.name)
                    self.labelTest2.text = character.name
                    
                case .failure(let error):
                    break
            }
        } */
        

        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        /*    labelTest2.text =
         String(FighterDC1 ?? 0) + "\n" + String(FighterDC2 ?? 0) + "\n" + String(FighterDC3 ?? 0) + "\n" */
   /*     labelTest.text =  String(
            DataManager.shared.getCharactersFromTeam(keyValue: keyValueFightTeamDCComics).count
        )
        + "\n" +
        String((UserDefaults.standard.object(forKey: keyValueFightTeamDCComics) as AnyObject).count ?? 8000) */
    }
    
    
    
    private func animateLoading(){}
    
    private func updateUserLocation(){
        guard CLLocationManager.locationServicesEnabled() else{
            return
        }
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
        
    }
    
    
    
    
    /*  private func setProgressCircleBar(frameAnimationview: UIView, endFrame :CGFloat){
     
     var animationView: AnimationView
     
     animationView = .init(name: "progresscircle_color")
     animationView.frame = frameAnimationview.bounds
     
     animationView.contentMode = .scaleAspectFit
     
     animationView.loopMode = .playOnce
     
     animationView.animationSpeed = 2
     
     frameAnimationview.addSubview(animationView)
     
     animationView.play()
     
     animationView.play(fromFrame: 0, toFrame: endFrame, loopMode: .none)
     
     
     } */
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        locationManager?.stopUpdatingLocation() //Hay que poner aquí o en el viewDidDissapear, que se pare de obtener la ubicación (porque sinó, sería un gasto de batería inecesario)
    }
    
    
}


extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        /* Implementar aquí la función que quieres que haga con las ubicacions que obtienes del usuario*/
        print(locations.last ?? "No available location")
        
        map.showsUserLocation = true
        
        //      manager.stopUpdatingLocation() //Hay que poner aquí o en el viewDidDissapear, que se pare de obtener la ubicación (porque sinó, sería un gasto de batería inecesario)
    }
    
}
