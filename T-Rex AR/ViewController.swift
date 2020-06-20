//
//  ViewController.swift
//  T-Rex AR
//
//  Created by Jeffrey  on 6/20/20.
//  Copyright © 2020 BMCC. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.autoenablesDefaultLighting = true
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        let dinoScene = SCNScene(named: "trex.dae")
        
        guard let dinoNode = dinoScene?.rootNode.childNode(withName: "T-Rex", recursively: true) else {
            fatalError("T-Rex is not found")
        }
        
        dinoNode.position = SCNVector3(0,0,-1.0)
        scene.rootNode.addChildNode(dinoNode)
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
 

}
