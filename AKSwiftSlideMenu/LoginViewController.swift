//
//  LoginViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/12/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    var ai : UIActivityIndicatorView = UIActivityIndicatorView()
    
    
    func activarAI()
    {
        ai.center = self.view.center
        ai.hidesWhenStopped = true
        ai.style = UIActivityIndicatorView.Style.whiteLarge
        view.addSubview(ai)
        ai.startAnimating()
    }
    
    func detenerAI()
    {
        ai.stopAnimating()
    }
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsuario: UITextField!
    
    var usuario = ""
    var password = ""
    var serial = ""
    var res = EstructuraLogin(idUsuario: 0, usuario: "", correo: "", validado: "", codValidacion: "", serieActual: "", paquete: "", fechaPaquete: "", error: "", codigoAmistad: "", amigosbuenPedo: "", fechaCreacion: "", token: "")
    let dispatchGroup = DispatchGroup()
    
    func loginAsync ()
    {
        DispatchQueue.main.async {
            
            let ser = ConsultasServiceImplService()
            
            let res = ser.loginUsuarioI(usuario:self.usuario, password: self.password, serial: self.serial)
            let stringres = res.replacingOccurrences(of: "#", with: "\"", options: .literal, range: nil)
            do
            {
                
                self.res = try  JSONDecoder().decode(EstructuraLogin.self,from:stringres.data(using: String.Encoding.utf8)!)
                
                self.dispatchGroup.leave()
                
                
                if self.res.error=="OK"
                {
                    
                    //aqui subimos a sesion todo
                    
                    UserDefaults.standard.set(self.res.idUsuario, forKey:"idUsuario");
                    UserDefaults.standard.set(self.password, forKey:"password");
                    UserDefaults.standard.set(self.res.usuario, forKey:"usuario");
                    UserDefaults.standard.set(self.res.codigoAmistad, forKey:"codigoAmistad");
                    
                    UserDefaults.standard.set(self.res.correo, forKey:"correoUsuario");
                    UserDefaults.standard.set(self.res.token, forKey:"token");
                    UserDefaults.standard.set(self.res.amigosbuenPedo, forKey:"amigosBuenPedo");
                    UserDefaults.standard.set(self.res.fechaPaquete, forKey:"fechaPaquete");
                    if self.res.paquete == nil
                    {
                        UserDefaults.standard.set("Sin suscripción", forKey:"paquete");
                    }
                    else
                    {
                        let nombrePaquete = "paquete: " + self.res.paquete!
                        UserDefaults.standard.set(nombrePaquete, forKey:"paquete");
                    }
                    
                    UserDefaults.standard.synchronize();
                    self.detenerAI()
                    
                        
                        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "homeNav"))!
                                                  vc.modalPresentationStyle = .fullScreen
                                                         self.show(vc, sender: nil)
                    
                }
                else if self.res.error=="CNV"
                {
                    self.detenerAI()
                    self.performSegue(withIdentifier: "irValidar", sender: "self")
                }
                else
                {
                    self.detenerAI()
                    self.mandarMensaje(mensaje: self.res.error ?? "", error: true)
                }
                
            }
            catch
            {
                print("Error info: \(error)")
                 print("JSON: \(res)")
                 print("Error info: \(error)")
            }
        }
        
        
    }
    
    @IBAction func btnEntrar(_ sender: Any) {
        
        
        
        if txtPassword.text! != "" && txtUsuario.text! != ""
        {
            let ut : Utils = Utils()
            usuario = txtUsuario.text!.trimmingCharacters(in: CharacterSet.init())
            password = ut.codificarMD5(string:  txtPassword.text!.trimmingCharacters(in: CharacterSet.init()))
            serial = ut.obtenerSerial()
            activarAI()
            dispatchGroup.enter()
            
            loginAsync()
           
            
            
        }
        else
        {
            detenerAI()
            mandarMensaje(mensaje: "Debes llenar todos los campos", error: true)
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
        //  validarSesion()
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
