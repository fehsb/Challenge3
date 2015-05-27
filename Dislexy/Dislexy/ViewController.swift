//
//  ViewController.swift
//  Dislexy
//
//  Created by Fernando on 5/14/15.
//  Copyright (c) 2015 Fernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgLogo: UIImageView!
    
    @IBOutlet weak var txtView: UITextView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var backGroundImg: UIImageView!
    
    @IBOutlet weak var seta1: UIImageView!
    
    @IBOutlet weak var seta2: UIImageView!
    
    @IBOutlet weak var seta3: UIImageView!
    
    
    @IBOutlet weak var viewInvisivel: UIView!
    
    
    let texto = ["Forme quatro palavras novas com a inicial da palavra dada em cada rodada.","Escolha a palavra que melhor se encaixa nos espaços.","Arraste as letras para suas devidas posições para formar palavras."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let x: AnyObject = defaults.valueForKey("ex1") {
        
        }else{
            defaults.setInteger(0, forKey: "ex1")
        }
        
        if let y: AnyObject = defaults.valueForKey("ex2") {
            
        }else{
            defaults.setInteger(0, forKey: "ex2")
        }

        if let z: AnyObject = defaults.valueForKey("ex3") {
            
        }else{
            defaults.setInteger(0, forKey: "ex3")
        }

        
        txtView.text = texto[pageControl.currentPage]
        
        update()
        
    }
    
    
    @IBAction func swipeDireita(sender: AnyObject) {
        
        if(pageControl.currentPage < 2){
            pageControl.currentPage++
            
            
            var posicao = self.txtView.frame.origin.x
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.txtView.frame.origin.x = -800
                self.txtView.alpha = 0.5
                
                }) { (bool: Bool) -> Void in
                    self.update()
                    self.txtView.frame.origin.x = UIScreen.mainScreen().bounds.width + self.txtView.frame.width
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.txtView.frame.origin.x = posicao
                        self.txtView.alpha = 1
                    })
            }
        }
        
    }
    
    
    @IBAction func swipeEsquerda(sender: AnyObject) {
        
        if(pageControl.currentPage > 0){
            pageControl.currentPage--
            
            var posicao = self.txtView.frame.origin.x
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.txtView.frame.origin.x = 800
                self.txtView.alpha = 0.5
                
                }) { (bool: Bool) -> Void in
                    self.update()
                    self.txtView.frame.origin.x = -self.txtView.frame.width
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.txtView.frame.origin.x = posicao
                        self.txtView.alpha = 1
                        }
                    )
            }
        }
        
    }
    
    
    func update(){
        txtView.text = texto[pageControl.currentPage]
        
        switch (pageControl.currentPage){
        case 0 :
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.seta1.alpha = 1.0
                self.seta2.alpha = 0.0
                self.seta3.alpha = 0.0
            })
            break
        case 1:
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.seta1.alpha = 0.0
                self.seta2.alpha = 1.0
                self.seta3.alpha = 0.0
            })
            break
        case 2:
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.seta1.alpha = 0.0
                self.seta2.alpha = 0.0
                self.seta3.alpha = 1.0
            })
            break
        default :
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.seta1.alpha = 0.0
                self.seta2.alpha = 0.0
                self.seta3.alpha = 0.0
            })
            break
        }
        
    }
}


