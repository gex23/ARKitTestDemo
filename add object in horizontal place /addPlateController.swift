//
//  addPlateController.swift
//  CheckHowMakenavigateAR
//
//  Created by Ragaie alfy on 12/24/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit
import ARKit
class addPlateController: NSObject ,ARSCNViewDelegate{
    
    var myView : addPlateView!
    
    override init() {
        super.init()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        // 1
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        // 2
        let width = CGFloat(planeAnchor.extent.x)
        let height = CGFloat(planeAnchor.extent.z)
        let plane = SCNPlane(width: width, height: height)
        
   
        
        // 3
       //
        //
       // plane.materials.first?.diffuse.contents = UIColor.lightGray
        
        // 4
//        let planeNode = SCNNode(geometry: plane)
//
//        // 5
        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
//        planeNode.position = SCNVector3(x,y,z)
//        planeNode.eulerAngles.x = -.pi / 2
//
//        node.addChildNode(planeNode)
        // 6
        
        
        
        
        /// test add plane view
        
        
        
        
        let skScene = SKScene(size: CGSize(width: 100, height: 100))
        skScene.backgroundColor = UIColor.clear
        
      var background =   SKSpriteNode.init(texture: SKTexture.init(image: UIImage.init(named: "shot")!))
        background.size = CGSize.init(width: 50, height: 50)
        background.position = CGPoint(x: 50, y: 50)
        

        skScene.addChild(background)

        let labelNode = SKLabelNode(text: "tap to add")
        // for animation
       // labelNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: .pi, duration: 2)))
        labelNode.fontColor = UIColor.blue
        labelNode.fontName = "Helvetica Neue Bold"
        labelNode.fontSize = 15
      
        labelNode.position = CGPoint(x:50,y:50)
        
        //labelNode.
        //skScene.addChild(rectangle)
        skScene.addChild(labelNode)
       
        let material = SCNMaterial()
        material.isDoubleSided = true
        material.diffuse.contents = skScene //UIImage.init(named: "ship.png")
    
        
        
        //var image = UIImage(named: "shot")
     
        
        plane.materials = [material]
        
        
        
        let nodex = SCNNode(geometry: plane)
        
        nodex.position = SCNVector3(x,y,z)
        nodex.eulerAngles.x = .pi / 2
        
        
        node.addChildNode(nodex)

        

        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
 
        // 1
//        guard let planeAnchor = anchor as?  ARPlaneAnchor,
//            let planeNode = node.childNodes.first,
//            let plane = planeNode.geometry as? SCNPlane
//            else { return }
//        
//        // 2
//        let width = CGFloat(planeAnchor.extent.x)
//        let height = CGFloat(planeAnchor.extent.z)
//        plane.width = width
//        plane.height = height
//        
//        // 3
//        let x = CGFloat(planeAnchor.center.x)
//        let y = CGFloat(planeAnchor.center.y)
//        let z = CGFloat(planeAnchor.center.z)

        
    }

    @objc func addShipToSceneView(withGestureRecognizer recognizer: UIGestureRecognizer) {
        let tapLocation = recognizer.location(in: myView.sceneView)
        let hitTestResults = myView.sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
        
        
        
        print(hitTestResults.count)
        
        guard let hitTestResult = hitTestResults.first else { return }
        let translation = hitTestResult.worldTransform.columns.3//translation
        let x = translation.x
        let y = translation.y
        let z = translation.z
        
        //sodaCan
        ///bottle
         //ChocolateCake  //glass
        guard let shipScene = SCNScene(named: "bottle.scn"),
            let shipNode = shipScene.rootNode.childNode(withName: "bottle", recursively: false)
            else { return }
        
        
        shipNode.position = SCNVector3(x,y,z)
        myView.sceneView.scene.rootNode.addChildNode(shipNode)
    }
}
