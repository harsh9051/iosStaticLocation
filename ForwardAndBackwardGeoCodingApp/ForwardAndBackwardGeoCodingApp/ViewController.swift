//
//  ViewController.swift
//  ForwardAndBackwardGeoCodingApp
//
//  Created by Vishwajeet Pandey on 16/05/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func b1Click() {
        let lat = 17.3850
        let lon = 78.4867
        
        if let loc = CLLocation(latitude: lat, longitude: lon) as? CLLocation {
            CLGeocoder().reverseGeocodeLocation(loc, completionHandler: {(placemarks,error) in
                if let placemark1 = placemarks?[0]{
                    let name = placemark1.name!
                    let country = placemark1.country!
                    let administrative = placemark1.administrativeArea!
                    let locality = placemark1.locality!
                    let postalCode = placemark1.postalCode!
                    
                    print("\(name),\(administrative),\(country),\(locality),\(postalCode)")
                    self.label1.text = "\(name),\(administrative),\(country),\(locality),\(postalCode)"
        
                
                }})
        }
                                                }
        
        
    
                                                
                                                
                                                
    
    @IBAction func b2Click() {
        let address = "muncipal office road,piduguralla,AP,India, 522413"
        CLGeocoder().geocodeAddressString(address, completionHandler: { placemarks, error in
            if(error != nil){
                return
            }
            if let placemark1 = placemarks?[0]{
                let lat = String(format : "%.04f",(placemark1.location?.coordinate.latitude ?? 0.0)!)
                let lon = String(format : "%.04f",(placemark1.location?.coordinate.longitude ?? 0.0)!)
                self.label2.text = "latitude:\(lat) and longitude: \(lon)"
            }
        })
        
    }
}

