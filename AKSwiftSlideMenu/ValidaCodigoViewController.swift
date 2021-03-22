//
//  ValidaCodigoViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/22/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit

class ValidaCodigoViewController: UIViewController,UITextFieldDelegate {
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mandarMensaje(mensaje: "Se envió un correo con su código de activación, por favor introduzcalo", error: false)
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
    @IBOutlet weak var txtCodigo: UITextField!
    
    @IBAction func btnValidar(_ sender: UIButton) {
        
        
        if txtCodigo.text! != "" && txtCorreo.text! != ""
        {
            let ser = ConsultasServiceImplService()
            let codigo=txtCodigo.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let correo=txtCorreo.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            do
            {
                let res = ser.validaCorreo(correo: correo, codigo: codigo)
                
                
                if res=="OK"
                {
                  
                    performSegue(withIdentifier: "irLoginDeValida", sender: "self")
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
            mandarMensaje(mensaje: "Código y correo son obligatorios", error: true)
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
