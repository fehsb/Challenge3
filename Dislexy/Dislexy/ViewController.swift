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
    
    
    @IBOutlet weak var viewInvisivel: UIView!
    
    let texto = ["bla bla bla","ble ble ble","bli bli bli"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtView.text = texto[pageControl.currentPage]
        
        
        
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
    }
}


