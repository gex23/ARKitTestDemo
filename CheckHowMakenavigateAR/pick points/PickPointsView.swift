//
//  ViewController.swift
//  CheckHowMakenavigateAR
//
//  Created by Ragaie alfy on 12/24/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit
import CoreLocation

class PickPointsView: UIViewController,CLLocationManagerDelegate{

    var myController : PickPointsController!
    
    @IBOutlet weak var pointsTableView: UITableView!
    @IBOutlet weak var savePointButton: UIBarButtonItem!
    

    var locationManager: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myController = PickPointsController()
        myController.myView = self
        
        pointsTableView.delegate = myController
        pointsTableView.dataSource = myController
        // Do any additional setup after loading the view, typically from a nib.
        
        savePointButton.action = #selector(PickPointsController.stopUpdatingLocation(_:))
        
        savePointButton.target = myController
        setupLocationService()
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(true)
        locationManager?.stopUpdatingLocation()
    }
    
    
    @IBAction func restValues(_ sender: Any) {
        
        myController.allLocations = []
        
        pointsTableView.reloadData()
        
        Singletone.allLocationsPoints = []
        
        
        
    }
    
    
    
    private func setupLocationService() {
   
    
        locationManager = CLLocationManager()
        
        locationManager?.requestWhenInUseAuthorization()

        guard let locationManager = locationManager else { return }
        switch(CLLocationManager.authorizationStatus()) {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
          //  lastLocation = locationManager.location
        case .notDetermined, .restricted, .denied:
            locationManager.startUpdatingLocation()
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.headingFilter = kCLHeadingFilterNone
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.delegate = myController
        
        
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

