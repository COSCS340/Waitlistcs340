//
//  ViewController.swift
//  WaitList
//
//  Created by Avie Desai on 2/2/18.
//  Copyright © 2018 Avie Desai. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let manager = CLLocationManager()
    var pickerView = UIPickerView()
    
    @IBOutlet weak var restaurant: UITextField!
    
    @IBOutlet weak var checkinButton: UIButton!
    
    @IBAction func checkinTap(_ sender: Any) {
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return locations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locations[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        restaurant.text = locations[row]
        checkinButton.isHidden = false
    }
    
    @objc func donePressed(){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(donePressed))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        restaurant.inputView = pickerView
        restaurant.inputAccessoryView = toolBar
       
    }

    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) -> CLLocationCoordinate2D {
        
        let nilLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
        
        if let error = error {
            print("Unable to Forward Geocode Address (\(error))")
            let alert = UIAlertController(title: "Error", message: "Unable to find location", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel) { action in
            })
            self.present(alert, animated: true, completion: nil)
            
        } else {
            var location: CLLocation?
            
            if let placemarks = placemarks, placemarks.count > 0 {
                location = placemarks.first?.location
            }
            
            if let location = location {
                let coordinate = location.coordinate
                
                //let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
                let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude)
                //let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
                //mapView.setRegion(region, animated: true)
                
                let myAnnotation: MKPointAnnotation = MKPointAnnotation()
                myAnnotation.coordinate = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
                myAnnotation.title = "Destination"
                // mapView.addAnnotation(myAnnotation)
                
                //self.mapView.showsUserLocation = true
                
                return myLocation
                
            } else {
                return nilLocation
            }
        }
        return nilLocation
    }

}

