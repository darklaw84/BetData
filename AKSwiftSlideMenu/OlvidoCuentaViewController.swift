//
//  ValidaCodigoViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/22/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit

class OlvidoCuentaViewController: UIViewController {
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    
   
    @IBOutlet weak var txtCorreo: UITextField!
   
    
    @IBAction func btnConsultar(_ sender: UIButton) {
        
        
        if txtCorreo.text! != ""
        {
            let ser = ConsultasServiceImplService()
           
            let correo=txtCorreo.text!.trimmingCharacters(in: .whitespacesAndNewlines)

            
            do
            {
                let res = ser.olvidoCredenciales(correo: correo, token: "HUGTHRIESOLDHFYTNCMVIO")
                
                
                if res=="OK"
                {
                  mandarMensaje(mensaje: "Se envio un correo con sus datos", error: false)
                    performSegue(withIdentifier: "irLoginOlvido", sender: "self")
                }
                    
                else
                {
                    mandarMensaje(mensaje: res, error: true)
                }
            }
            catch {
                print("Error info: \(error)")
            }
            
            
        }
        else
        {
            mandarMensaje(mensaje: "El correo es obligatorio", error: true)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
