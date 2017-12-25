//
//  ShowRouteView.swift
//  CheckHowMakenavigateAR
//
//  Created by Ragaie alfy on 12/24/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit
import SceneKit

import ARKit
class ShowRouteView: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    @IBOutlet weak var resultData: UILabel!
    
    
    var myController : ShowRouteController!
      private let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()

        myController = ShowRouteController()
        myController.myView = self
        
        setupScene()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    private func setupScene() {
        sceneView.delegate = myController
        sceneView.showsStatistics = true
        let scene = SCNScene()
        sceneView.scene = scene
        navigationController?.setNavigationBarHidden(true, animated: false)
        runSession()
    }
    
    func runSession() {
        configuration.worldAlignment = .gravityAndHeading
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }

    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        
        resultData.text = ""
    
        if  myController.anchors.count > 0{
            
            for anchor in myController.anchors {
                sceneView.session.remove(anchor: anchor)
            }
            
            
        }
        
        if Singletone.allLocationsPoints.count > 0 {
            
         
            
            for item in Singletone.allLocationsPoints{
               myController.addSphere(for: item)
            }
        }
        
        
    }

}
