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
            }
            update()
            
    }
    
    
    @IBAction func swipeEsquerda(sender: AnyObject) {
        
        if(pageControl.currentPage > 0){
            pageControl.currentPage--
        }
        update()
        
    }
    
    
    func update(){
        txtView.text = texto[pageControl.currentPage]
    }
}


