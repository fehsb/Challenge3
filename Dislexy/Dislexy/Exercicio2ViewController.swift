//
//  Exercicio2ViewController.swift
//  Dislexy
//
//  Created by Rafael Fernandes de Oliveira Carvalho on 5/19/15.
//  Copyright (c) 2015 Fernando. All rights reserved.
//

import UIKit

class Exercicio2ViewController: UIViewController {
    
    
    @IBOutlet weak var txtView: UITextView!
    
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    
    
    var frases:[String] = ["Ontem Maria ia comprar um __________ de borracha.",
        "No entanto, preferiu comprar um __________ de pelúcia porque era mais barato.",
        "O pai deu-lhe um pouco mais de dinheiro para ela poder passear. Quando voltou para __________ e .. ",
        " deitou-se em sua __________ , ficou pensando no pato que tinha deixado para trás.",
        "Então teve uma ideia. Pensou voltar na loja no dia seguinte e comprar um pato e uma __________ .",
        "No dia seguinte, entretanto, ficou de __________ aberta. Para sua tristeza, o pato e a pata já tinham sido vendidos."]
    
    var certo:[String] = ["pato","sapo","casa","cama","pata","boca"]
    
    var errado:[String] = ["topa","posa","saca","maca","tapa","cabo"]
    
    var cont:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rodaJogo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    func rodaJogo(){
        
        txtView.text = frases[cont]
        
        if (cont == 0){
            btn1.setTitle(certo[cont], forState: .Normal)
            btn2.setTitle(errado[cont], forState: .Normal)
        }else{
            
            if((cont%2) == 0){
                btn1.setTitle(certo[cont], forState: .Normal)
                btn2.setTitle(errado[cont], forState: .Normal)
            }else{
                btn1.setTitle(errado[cont], forState: .Normal)
                btn2.setTitle(certo[cont], forState: .Normal)
            }
        }
        
        cont++
    }
    
    @IBAction func botao1(sender: AnyObject) {
        
        rodaJogo()
    }
    
    
    @IBAction func botao2(sender: AnyObject) {
        
        rodaJogo()
        
    }
    
    func sair(){
        
        //        let secondViewController:ViewController = self.storyboard!.instantiateViewControllerWithIdentifier("principal") as! ViewController
        //
        //        self.presentViewController(secondViewController, animated: true, completion: nil)
        
        navigationController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    @IBAction func voltar(sender: AnyObject) {
        sair()
    }
    
}
