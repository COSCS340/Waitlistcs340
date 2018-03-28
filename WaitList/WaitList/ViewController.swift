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
import Firebase
import FirebaseStorage

class MyButton : UIButton
{
    var mylocation = String()
}

var checkoutrestaurant = ""

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    
    var globalMyLocation = CLLocationCoordinate2D()
    var database = Database.database().reference()
    var storageref = Storage.storage().reference()
    
    @IBOutlet weak var restaurants: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    let cellSpacingHeight: CGFloat = 20
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return locations.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 124
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = restaurants.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RestaurantTableViewCell
        
        cell.myname.text = locations[indexPath.section]
        cell.restaurantImage.image = profilepics[cell.myname.text!]
        cell.checkinButton.mylocation = cell.myname.text!
        
        self.database.child("Times").observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children
            {
                
                let snap = child as! DataSnapshot
                let name = snap.key
                let minutes = snap.value as! Int
                var hour : Int
                var min : Int
                hour = minutes / 60
                min = minutes % 60
                if(name == cell.myname.text)
                {
                    cell.actualtimeLabel.text = String(hour) + " Hour(s) " + String(min) + " Min."
                }
            }
            
            
        })
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        cell.checkinButton.addTarget(self, action: #selector(completeClick), for: UIControlEvents.touchUpInside)
    

        //cell.restaurantImage.layer.cornerRadius = cell.restaurantImage.frame.size.width/2
        //cell.restaurantImage.clipsToBounds = true
        cell.restaurantImage.layer.borderColor = UIColor.black.cgColor
        cell.restaurantImage.layer.borderWidth = 2
        
        
        return cell
    }
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        restaurants.delegate = self
        restaurants.dataSource = self
        restaurants.allowsSelection = false
        
        refreshUsers(self)
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        refreshControl.addTarget(self, action: #selector(refreshUsers), for: .valueChanged)
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0), NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)]
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Restaurants...", attributes: attributes)
        
        if #available(iOS 10.0, *) {
            restaurants.refreshControl = refreshControl
        } else {
            restaurants.addSubview(refreshControl)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshUsers(self)
    }
    
    @objc func refreshUsers(_ sender: Any) {
        self.database.child("Locations").observeSingleEvent(of: .value, with: { (snapshot) in
            locations.removeAll()
            locationaddr.removeAll()
            for child in snapshot.children
            {
                let snap = child as! DataSnapshot
                let name = snap.key
                locations.append(name)
                locationaddr[name] = snap.value as? String
                let url = "LocationPics/" + name + ".jpg"
                let pic = self.storageref.child(url)
                pic.getData(maxSize: 1 * 1024 * 1024) { (data, error) -> Void in
                    if let error = error
                    {
                        print(error)
                        let url2 = "LocationPics/Ray's Place.jpg"
                        let pic2 = self.storageref.child(url2)
                        pic2.getData(maxSize: 1 * 1024 * 1024) { (data, error) -> Void in
                                profilepics[name] = UIImage(data: data!)
                        }
                    }
                    else
                    {
                        profilepics[name] = UIImage(data: data!)
                    }
                    
                }
            }
            
            self.restaurants.reloadData()
            self.refreshControl.endRefreshing()
            
        })
        
        
        
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        //let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        globalMyLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        //print("Global Location")
        //print(globalMyLocation)
        //let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        //mapView.setRegion(region, animated: true)
        
        //self.mapView.showsUserLocation = true
        
    }
    
      @objc func completeClick(sender: MyButton) {
        let address = locationaddr[sender.mylocation] as! String
        print("Address is " + address)
        CLGeocoder().geocodeAddressString(address, completionHandler: { (placemarks, error) in
            // Process Response
            let destinationLocation =  self.processResponse(withPlacemarks: placemarks, error: error)
            //print("Destination")
            //print(destinationLocation.latitude)
            //print(destinationLocation.longitude)
            let current: MKMapPoint = MKMapPointForCoordinate(self.globalMyLocation)
            //print("Current")
            //print(self.globalMyLocation.latitude)
            //print(self.globalMyLocation.longitude)
            
            let destination: MKMapPoint = MKMapPointForCoordinate(destinationLocation)
            
            let distanceInMeters: CLLocationDistance = MKMetersBetweenMapPoints(current, destination)
            
            let distanceInMiles = distanceInMeters * 0.000621371
            print(distanceInMiles)
            
            if(distanceInMiles > 0.05)
            {
                checkoutrestaurant = sender.mylocation
                self.database.child("Times").observeSingleEvent(of: .value, with: { (snapshot) in
                    for child in snapshot.children
                    {
                        
                        let snap = child as! DataSnapshot
                        let name = snap.key
                        var minutes = snap.value as? Int
                        if(name == sender.mylocation)
                        {
                            minutes = minutes! + 2
                            self.database.child("Times").child(sender.mylocation).setValue(minutes)
                        }
                    }
                    
                    
                })
                
                let main = UIStoryboard(name: "Main", bundle: nil)
                let newclass: CheckOutViewController = main.instantiateViewController(withIdentifier: "CheckOutViewController") as! CheckOutViewController
                self.present(newclass, animated: true, completion: nil)
            }
            else
            {
                let alert = UIAlertController(title: "Error", message: "You have to be within 0.05 miles to check in", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel) { action in
                })
                self.present(alert, animated: true, completion: nil)
            }
            
        })
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

