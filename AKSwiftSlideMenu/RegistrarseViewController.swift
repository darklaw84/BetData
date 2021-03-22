//
//  RegistrarseViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/22/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit
import SafariServices

class RegistrarseViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var btnRegistrarse: UIButton!
    
    
    @IBOutlet weak var chkPolitica: UISwitch!
    @IBOutlet weak var chkAviso: UISwitch!
  
    @IBOutlet weak var txtRegUsuario: UITextField!
    
    @IBOutlet weak var txtRegCodAmis: UITextField!
    
    @IBOutlet weak var txtRegCorreo: UITextField!
    
    
    @IBOutlet weak var txtRegPass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnRegistrarse.isEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func btnRegistrarseAC(_ sender: UIButton) {
        
        let ut : Utils = Utils()
        if txtRegUsuario.text! != "" && txtRegCorreo.text! != "" && txtRegPass.text! != ""
        {
            let ser = ConsultasServiceImplService()
            let password = ut.codificarMD5(string: txtRegPass.text!.trimmingCharacters(in: .whitespacesAndNewlines))
            let usuario=txtRegUsuario.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let correo=txtRegCorreo.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let codigoAmistad=txtRegCodAmis.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
                let res = ser.registraUsuario(usuario: usuario, password: password, correo: correo, codigoAmistad: codigoAmistad)
                if res=="OK"
                {
                    performSegue(withIdentifier: "irValidarRegistro", sender: "self")
                }
                    
                else
                {
                    mandarMensaje(mensaje: res, error: true)
                }
            
            
            
        }
        else
        {
            mandarMensaje(mensaje: "Usuario, password y correo son obligatorios", error: true)
        }
        
    }
    
    
    @IBAction func chkPoliticaChange(_ sender: UISwitch) {
        if chkAviso.isOn && chkPolitica.isOn
        {
            btnRegistrarse.isEnabled = true
        }
        else
        {
            btnRegistrarse.isEnabled = false
        }
    }
    
    @IBAction func chkAvisoChange(_ sender: UISwitch) {
        if chkAviso.isOn && chkPolitica.isOn
        {
            btnRegistrarse.isEnabled = true
        }
        else
        {
            btnRegistrarse.isEnabled = false
        }
    }
    
    
    
    @IBAction func btnAviso(_ sender: Any) {
        
        guard let url = URL(string: "http://betdatanalysis.com/doctos/BetDataAnalysis_Aviso_Legal.pdf") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func btnPolitica(_ sender: Any) {
        guard let url = URL(string: "http://betdatanalysis.com/doctos/BetDataAnalysis_Politica_de_Privacidad.pdf") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnViolaciones(_ sender: Any) {
        guard let url = URL(string: "http://betdatanalysis.com/doctos/BetDataAnalysis_Violaciones_Seguridad.pdf") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            // Fallback on earlier versions
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
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
    
   

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
