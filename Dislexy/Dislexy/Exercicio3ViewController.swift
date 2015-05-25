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
    
    var jogadas = 0
    
    var escolha = 0
    
    @IBOutlet weak var btnDica: UIButton!
    
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
        //        let hudView = HUDView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        //        self.view.addSubview(hudView)
        //        controller.hud = hudView
        
        //controller.onAnagramSolved = self.showLevelMenu
        controller.onAnagramSolved = self.showFinal
    }
    
    //show the game menu on app start
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        self.shoeLevelMenu()
        
        self.view.bringSubviewToFront(btnDica)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func shoeLevelMenu(){
        
        var sucessTitle = "Escolha o level:"
        var subtitle = String()
        
        subtitle = ""
        
        let alert = SCLAlertView()
        
        alert.addButton("Level 1", action: { () -> Void in
            self.showLevel(1)
            self.escolha = 1
            
        })
        
        alert.addButton("Level 2", action: { () -> Void in
            self.showLevel(2)
            self.escolha = 2
        })
        
        alert.addButton("Sair", target: alert, selector: "hideView")
        
        alert.showSuccess(sucessTitle, subTitle: subtitle)
        
        
    }
    
    func showFinal(){
        
            jogadas++
        
        
        if (jogadas == 3) {
            var sucessTitle = "Parábens"
            var subtitle = String()
            
            subtitle = "Continue sempre praticando :)"
            
            let alert = SCLAlertView()
            
            
            alert.addButton("Jogar novamente", action: { () -> Void in
                alert.hideView()
                self.shoeLevelMenu()
                self.jogadas = 0
            })
            
            alert.addButton("Sair do exercício", action: { () -> Void in
                alert.hideView()
                self.sair()
            })
            
            alert.showSuccess(sucessTitle, subTitle: subtitle)
        }else{
            self.showLevel(escolha)
        }
    }
    
    func showLevelMenu() {
        //1 show the level selector menu
        let alertController = UIAlertController(title: "Escolha a dificuldade:",
            message: nil,
            preferredStyle:UIAlertControllerStyle.Alert)
        
        //2 set up the menu actions
        let easy = UIAlertAction(title: "Nivel 1", style:.Default,
            handler: {(alert:UIAlertAction!) in
                self.showLevel(1)
        })
        let hard = UIAlertAction(title: "Nivel 2", style:.Default,
            handler: {(alert:UIAlertAction!) in
                self.showLevel(2)
        })
        let hardest = UIAlertAction(title: "Nivel 3", style: .Default,
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
    
    func sair(){
        
        navigationController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func voltar(sender: AnyObject) {
        sair()
    }
    
    @IBAction func DicaButton(sender: AnyObject) {
        
        controller.actionHint()
        
    }
    
    
}
