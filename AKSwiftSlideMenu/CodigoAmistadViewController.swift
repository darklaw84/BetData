//
//  ValidarViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/20/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit

class CodigoAmistadViewController: UIViewController {
    
    
    @IBOutlet weak var lblCodigoAmistad: UILabel!
    
    @IBOutlet weak var lblAmigosBuenPedo: UILabel!
    
    @IBAction func btnMandarWhatss(_ sender: UIButton) {
        
        var mensaje = "whatsapp://send?text=Unete a Bet Data Analysis con este codigo de amistad: " + UserDefaults.standard.string(forKey: "codigoAmistad")! + " En iOS: https://apps.apple.com/mx/app/bet-data-analysis/id1481253726    En Android : https://play.google.com/store/apps/details?id=comes.betdata.analysis     http://www.betdatanalysis.com/"
        var url =  NSURL(string: mensaje.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)
        
       
        
        if UIApplication.shared.canOpenURL(url! as URL)
        {
             UIApplication.shared.openURL(url! as URL)
            
        }
        else{
            mandarMensaje(mensaje: "No se puede mandar el código por whatsapp", error: true)
        }
        
    }
    
    
   
    
    
    func mandarMensaje( mensaje:String, error:Bool)
    {
        var titulo = String()
        if error
        {
            titulo="Error"
        }
        else
        {
            titulo="Mensaje"
        }
        
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let amigosBuenPedo = UserDefaults.standard.string(forKey: "amigosBuenPedo")
        if amigosBuenPedo == nil
        {
       
            lblAmigosBuenPedo.text = "0/10"
        }
        else
        {
         lblAmigosBuenPedo.text = amigosBuenPedo! + "/10"
        }
        lblCodigoAmistad.text = UserDefaults.standard.string(forKey: "codigoAmistad")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func btnRegresar(_ sender: Any) {
        regresarAPaises()
        
    }
    
    
    func regresarAPaises()
    {
        let sus = (self.storyboard?.instantiateViewController(withIdentifier: "paisesViewController"))!
                             sus.modalPresentationStyle = .fullScreen
        
                                    self.show(sus, sender: nil)
        
    }
}
