//
//  addPlateView.swift
//  CheckHowMakenavigateAR
//
//  Created by Ragaie alfy on 12/24/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit
import ARKit
class addPlateView: UIViewController {

    var myController : addPlateController!
    
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myController = addPlateController()
        myController.myView = self
        setUpSceneView()
        addTapGestureToSceneView()
        // Do any additional setup after loading the view.
    }


    


    func setUpSceneView() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        sceneView.session.run(configuration)
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
        sceneView.delegate = myController
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
    }

    
    func addTapGestureToSceneView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: myController, action: #selector(addPlateController.addShipToSceneView(withGestureRecognizer:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
}
