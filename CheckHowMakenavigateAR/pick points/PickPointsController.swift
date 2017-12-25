//
//  ShowRouteController.swift
//  CheckHowMakenavigateAR
//
//  Created by Ragaie alfy on 12/24/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//
import UIKit
import CoreLocation

class PickPointsController: NSObject ,UITableViewDelegate,UITableViewDataSource, CLLocationManagerDelegate {
    
    var myView : PickPointsView!
    
    
    var currentLocation: CLLocation?
      var allLocations: [CLLocation] = []

    override init() {
        
        super.init()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allLocations.count
    }
    
    //// cell id---> pointCellID

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "pointCellID", for: indexPath)
       
        cell.textLabel?.text = "lat -->  \(allLocations[indexPath.row].coordinate.latitude)"
        cell.detailTextLabel?.text = "lat -->  \(allLocations[indexPath.row].coordinate.longitude)"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    
    ///// for getting location
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        currentLocation = manager.location
        
        print("\(currentLocation?.coordinate.latitude), ---- long  \(currentLocation?.coordinate.latitude)" )

    }
    
    
    
    

      @objc  func stopUpdatingLocation(_ sender : AnyObject) {
        
        allLocations.append((myView.locationManager?.location)!)
        
        
        print("------> picked\(myView.locationManager?.location?.coordinate.latitude), ---- long  \(myView.locationManager?.location?.coordinate.latitude)" )

        Singletone.allLocationsPoints.append((myView.locationManager?.location)!)
        
        myView.pointsTableView.reloadData()
        //myView.locationManager?.stopUpdatingLocation()
    }
}


