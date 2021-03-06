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
    
    
    var frases:[String] = ["Ontem Maria ia comprar um _______ de borracha.",
        "No entanto, preferiu comprar um _______ de pelúcia porque era mais barato.",
        "O pai deu-lhe um pouco mais de dinheiro para ela poder passear. Quando voltou para _______ e... ",
        " deitou-se em sua _______ , ficou pensando no pato que tinha deixado para trás.",
        "Então teve uma ideia. Pensou voltar na loja no dia seguinte e comprar um pato e uma _______ .",
        "No dia seguinte, entretanto, ficou de _______ aberta. Para sua tristeza, o pato e a pata já tinham sido vendidos."]
    
    var certo:[String] = ["pato","sapo","casa","cama","pata","boca"]
    
    var errado:[String] = ["topa","posa","saca","maca","tapa","cabo"]
    
    var cont:Int = 0
    
    var acertos = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = NSUserDefaults.standardUserDefaults()
        var vez = defaults.valueForKey("ex2") as! Int
        if (vez == 0){
            
            instruction()
            defaults.setInteger(1, forKey: "ex2")
            
        }
        
        rodaJogo()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "alertIsGone", name: "alertWillDisappear", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "alertIsGone2", name: "back", object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    func rodaJogo(){
        
        if (cont == certo.count){
            cont = 0
            //Exibir alerta
            var subtitle = String()
            
            subtitle = "Você obteve \(acertos)/6 acertos"
            
            self.acertos = 0
            
            self.showAlerta(subtitle)

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
    
    func showAlerta(sb : String){
        
        var sucessTitle = "FIM"
        var subtitle = sb
        
        
        let alert = SCLAlertView()
        
        alert.addButton("Tentar Novamente", action: { () -> Void in
            self.acertos = 0
            alert.hideView()
            self.rodaJogo()
            
        })
        
        alert.addButton("Sair", action: { () -> Void in
            alert.hideView()
            self.sair()
        })
        
        
        alert.showSuccess(sucessTitle, subTitle: subtitle)
        
    }
    

    
    @IBAction func info(sender: AnyObject) {
        instruction()
    }
    
    
    func alertIsGone() {
        rodaJogo()
        acertos = 0
    }
    
    func alertIsGone2() {
        sair()
    }
    
    func instruction(){
        var subtitle = ""
        var tempo = NSTimeInterval.infinity
        
        let alert = SCLAlertView()
        
        alert.showInfo("Instruções", subTitle: "Toque na palavra mais adequada ao campo vazio", closeButtonTitle: "Ok", duration: tempo )
        
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
