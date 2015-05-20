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
    
    var acertos = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rodaJogo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    func rodaJogo(){
        
        if (cont == certo.count){
            cont = 0
            //Exibir alerta
            var sucessTitle = "FIM"
            var subtitle = String()
            
            subtitle = "Você obteve \(acertos) acertos"
            
            let alert = SCLAlertView()
            
            alert.addButton("Jogar Novamente"){
                self.acertos = 0
                self.rodaJogo()
            }
            alert.addButton("Sair", target:self, selector:"sair")
            
            alert.showSuccess(sucessTitle, subTitle: subtitle)
            

        }else{
        
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
        

        }
    }
    
    @IBAction func botao1(sender: AnyObject) {
        var val = btn1.currentTitle
        if ((val)==(certo[cont])){
            acertos++
        }
        cont++
        rodaJogo()
    }
    
    
    @IBAction func botao2(sender: AnyObject) {
        var val = btn2.currentTitle
        if ((val)==(certo[cont])){
            acertos++
        }
        cont++
        rodaJogo()
        
    }
    
    func sair(){
        

        navigationController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    @IBAction func voltar(sender: AnyObject) {
        sair()
    }
    
}
