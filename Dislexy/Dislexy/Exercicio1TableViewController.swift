//
//  Exercicio1TableViewController.swift
//  Dislexy
//
//  Created by Fernando on 5/15/15.
//  Copyright (c) 2015 Fernando. All rights reserved.
//

import UIKit

class Exercicio1TableViewController: UITableViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var letra: UILabel!
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var textField3: UITextField!
    
    @IBOutlet weak var textField4: UITextField!
    
    var palav:String = ""
    var acertos:Int = 0
    var jogadas:Int = 0
    var palavras:[String] = ["dado","dedo","diretor","bola","banana","barba","pato","porco","pedra","queijo","quadro","quadrado","nariz","nabo","nuvem","urso","uva","umbigo","macaco","marrom","maracujá"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        
        iniciaJogo()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func btnOk(sender: AnyObject) {
        
        
        
        if(textField1.text == ""){
            SCLAlertView().showNotice("ATENÇÃO", subTitle: "Todos os campos devem ser preenchidos com palavras.")
            return
        }
        if(textField2.text == ""){
            SCLAlertView().showNotice("ATENÇÃO", subTitle: "Todos os campos devem ser preenchidos com palavras.")
            return
        }
        if(textField3.text == ""){
            SCLAlertView().showNotice("ATENÇÃO", subTitle: "Todos os campos devem ser preenchidos com palavras.")
            return
        }
        if(textField4.text == ""){
            SCLAlertView().showNotice("ATENÇÃO", subTitle: "Todos os campos devem ser preenchidos com palavras.")
            return
        }else{
       verificaAcerto()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func verificaAcerto(){
        
        let index = advance(palav.startIndex, 0)
        var letrinha = palav[index]
        
        var erros = 0
        
        let field1 = textField1.text
        let letra1 = field1[index]
        
        let field2 = textField2.text
        let letra2 = field2[index]
        
        let field3 = textField3.text
        let letra3 = field3[index]
        
        let field4 = textField4.text
        let letra4 = field4[index]
        
        if (letrinha != letra1){
            erros++
        }
        if (letrinha != letra2){
            erros++
        }
        if (letrinha != letra3){
            erros++
        }
        if (letrinha != letra4){
            erros++
        }
        
        if (erros == 0){
            acertos++}
        iniciaJogo()
    }
    

    @IBAction func toque(sender: AnyObject) {
        self.view.endEditing(true)
    }
    

    func iniciaJogo(){
        if jogadas == 3 {
        //chama o alerta com os resultados
            var sucessTitle = "FIM"
            var subtitle = String()
            
            switch(acertos){
                case 0:
                    subtitle = "Você não acertou nenhuma rodada. Continue treinando e chegará lá."
                break
                case 1:
                    subtitle = "Você conseguiu 1 acerto. Continue treinando e chegará lá."
                break
                case 2:
                    subtitle = "Muito bom! Você conseguiu 2 acertos. Continue treinando e chegará lá."
                break
                case 3:
                    subtitle = "Parabéns! Você acertou tudo. Mas não se esqueça: a prática leva a perfeição."
                break
            default:
                subtitle = "error"
                break
            }
            
            let alert = SCLAlertView()
            
            alert.addButton("Jogar Novamente"){
                self.acertos = 0
                self.iniciaJogo()
            }
            alert.addButton("Sair", target:self, selector:"sair")
        
            alert.showSuccess(sucessTitle, subTitle: subtitle)
            
        }else{
        //incrementa jogadas
            jogadas++
            palav = randomPalavra()
            letra.text = palav
            limpaCampos()
        }
    }
    
    func sair(){
        
//        let secondViewController:ViewController = self.storyboard!.instantiateViewControllerWithIdentifier("principal") as! ViewController
//        
//        self.presentViewController(secondViewController, animated: true, completion: nil)
        
        navigationController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func limpaCampos(){
        textField1.text = ""
        textField2.text = ""
        textField3.text = ""
        textField4.text = ""
    }
    
    
    @IBAction func voltar(sender: AnyObject) {
        sair()
    }
    
    
    // palavra randomica
    func randomPalavra() -> String {
        var numero = Int(arc4random_uniform(21))
        var i:Int = numero
        return palavras[i]
    }
    
    // caractere randomico
    func randomChar() -> String {
        
        var inicio:UInt32 = 65
        var fim:UInt32 = 90
        var letraNumero = arc4random_uniform(fim-inicio) + inicio
        var letra = ""
        letra.append(Character(UnicodeScalar(letraNumero)))
        return letra
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
    
    // Configure the cell...
    
    return cell
    }
    */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
