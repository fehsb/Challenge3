//
//  Exercicio3ViewController.swift
//  Dislexy
//
//  Created by Fernando on 5/21/15.
//  Copyright (c) 2015 Fernando. All rights reserved.
//

import UIKit

class Exercicio3ViewController: UIViewController {
    private let controller:GameController
    
    required init(coder aDecoder: NSCoder) {
        controller = GameController()
        super.init(coder: aDecoder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add one layer for all game elements
        let gameView = UIView(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight))
        self.view.addSubview(gameView)
        controller.gameView = gameView
        
        //add one view for all hud and controls
        let hudView = HUDView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        self.view.addSubview(hudView)
        controller.hud = hudView
        
        controller.onAnagramSolved = self.showLevelMenu
    }
    
    //show the game menu on app start
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.showLevelMenu()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func showLevelMenu() {
        //1 show the level selector menu
        let alertController = UIAlertController(title: "Choose Difficulty Level",
            message: nil,
            preferredStyle:UIAlertControllerStyle.Alert)
        
        //2 set up the menu actions
        let easy = UIAlertAction(title: "Easy-peasy", style:.Default,
            handler: {(alert:UIAlertAction!) in
                self.showLevel(1)
        })
        let hard = UIAlertAction(title: "Challenge accepted", style:.Default,
            handler: {(alert:UIAlertAction!) in
                self.showLevel(2)
        })
        let hardest = UIAlertAction(title: "I'm totally hard-core", style: .Default,
            handler: {(alert:UIAlertAction!) in
                self.showLevel(3)
        })
        
        //3 add the menu actions to the menu
        alertController.addAction(easy)
        alertController.addAction(hard)
        alertController.addAction(hardest)
        
        //4 show the UIAlertController
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    //5 show the appropriate level selected by the player
    func showLevel(levelNumber:Int) {
        controller.level = Level(levelNumber: levelNumber)
        controller.dealRandomAnagram()
    }
    
}