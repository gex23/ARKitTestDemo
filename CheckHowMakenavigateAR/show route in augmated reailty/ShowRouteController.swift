//
//  ShowRouteController.swift
//  CheckHowMakenavigateAR
//
//  Created by Ragaie alfy on 12/24/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import CoreLocation
import MapKit
class ShowRouteController: NSObject ,ARSCNViewDelegate{
    
    
     var anchors: [ARAnchor] = []
    
    private var nodes: [BaseNode] = []
    
    private var steps: [MKRouteStep] = []
    
    var count : Int! = 0
    var myView : ShowRouteView!
    override init() {
        
        super.init()
    }
    
    
    
    
//    private func addSphere(for step: MKRouteStep) {
//        let stepLocation = step.getLocation()
//        let locationTransform = MatrixHelper.transformMatrix(for: matrix_identity_float4x4, originLocation: stepLocation, location: stepLocation)
//       // let locationTransform = MatrixHelper.transformMatrix(for: matrix_identity_float4x4, originLocation: startingLocation, location: stepLocation)
//
//
//        let stepAnchor = ARAnchor(transform: locationTransform)
//
//        let sphere = BaseNode(title: step.instructions, location: stepLocation)
//        anchors.append(stepAnchor)
//
//        sphere.addNode(with: 0.3, and: .green, and: step.instructions)
//        sphere.location = stepLocation
//        sphere.anchor = stepAnchor
//        myView.sceneView.session.add(anchor: stepAnchor)
//        myView.sceneView.scene.rootNode.addChildNode(sphere)
//        nodes.append(sphere)
//    }

    
    // For intermediary locations - CLLocation - add sphere
    
     func addSphere(for location: CLLocation) {
        let locationTransform = MatrixHelper.transformMatrix(for: matrix_identity_float4x4, originLocation: Singletone.allLocationsPoints.first!, location: location)
        
        //  let locationTransform = MatrixHelper.transformMatrix(for: matrix_identity_float4x4, originLocation: startingLocation, location: location)
        /// anchor
        
        
        printPositionFromTransform(locationTransform)
        
        
        let stepAnchor = ARAnchor(transform: locationTransform)
        // create node for ar session
        let sphere = BaseNode(title: "Title", location: location)
        
        switch count {
        case 0:
            
            sphere.addSphere(with: 0.25, and: .green)
        case 1:
            
            sphere.addSphere(with: 0.25, and: .red)
        case 2:
            
            sphere.addSphere(with: 0.25, and: .brown)

        default:
            sphere.addSphere(with: 0.25, and: .blue)

        }
       // sphere.addSphere(with: 0.25, and: .blue)
        anchors.append(stepAnchor)
        sphere.location = location
        myView.sceneView.session.add(anchor: stepAnchor)
        myView.sceneView.scene.rootNode.addChildNode(sphere)
        
        
        sphere.anchor = stepAnchor
        nodes.append(sphere)
    }
    private func positionFromTransform(_ transform: matrix_float4x4) -> SCNVector3 {
        return SCNVector3Make(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)
    }
    
    func printPositionFromTransform(_ transform: matrix_float4x4)  {
        
        var resultString = "x = \(transform.columns.3.x), y =  \(transform.columns.3.y), z =  \( transform.columns.3.z)\n"
        print(resultString)
        
        myView.resultData.text?.append(resultString)
    }
  // we need check effect of it 
    
//    private func updateNodePosition() {
//        locationUpdates += 1
//        if updateNodes {
//            SCNTransaction.begin()
//            SCNTransaction.animationDuration = 0.5
//            if updatedLocations.count > 0 {
//                startingLocation = CLLocation.bestLocationEstimate(locations: updatedLocations)
//                for baseNode in nodes {
//                    let translation = MatrixHelper.transformMatrix(for: matrix_identity_float4x4, originLocation: startingLocation, location: baseNode.location)
//                    let position = positionFromTransform(translation)
//                    let distance = baseNode.location.distance(from: startingLocation)
//                    DispatchQueue.main.async {
//                        let scale = 100 / Float(distance)
//                        baseNode.scale = SCNVector3(x: scale, y: scale, z: scale)
//                        baseNode.anchor = ARAnchor(transform: translation)
//                        baseNode.position = position
//                    }
//                }
//            }
//            SCNTransaction.commit()
//        }
//    }
    

}
