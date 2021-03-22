//
//  MenuViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Ashish on 21/09/15.
//  Copyright (c) 2015 Kode. All rights reserved.
//

import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class MenuViewController: UIViewController{
    
    
    
    /**
     *  Transparent button to hide menu
     */
    @IBOutlet var btnCloseMenuOverlay : UIButton!
    
    /**
     *  Array containing menu options
     */
    var arrayMenuOptions = [Dictionary<String,String>]()
    
    /**
     *  Menu button which was tapped to display the menu
     */
    var btnMenu : UIButton!
    
    /**
     *  Delegate of the MenuVC
     */
    var delegate : SlideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    
    @IBAction func onCloseMenuClick(_ button:UIButton!){
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
    }
    
    
    
    
    @IBAction func btnSuscripcion(_ sender: Any) {
        let sus = (self.storyboard?.instantiateViewController(withIdentifier: "SuscripcionViewController"))!
                                 sus.modalPresentationStyle = .fullScreen
            
                                        self.show(sus, sender: nil)
        
    }
    
    @IBAction func imgSuscripcion(_ sender: Any) {
           let sus = (self.storyboard?.instantiateViewController(withIdentifier: "SuscripcionViewController"))!
                                    sus.modalPresentationStyle = .fullScreen
               
                                           self.show(sus, sender: nil)
           
       }
    
    
    
    @IBAction func btnCodigoAmistad(_ sender: Any) {
        
        mostrarCodigoAmistad()
    }
    
    
    @IBAction func imgCodigoAmistad(_ sender: Any) {
        mostrarCodigoAmistad()
    }
    
    
    func mostrarCodigoAmistad()
    {
        let sus = (self.storyboard?.instantiateViewController(withIdentifier: "CodigoAmistadViewController"))!
                             sus.modalPresentationStyle = .fullScreen
        
                                    self.show(sus, sender: nil)
        
    }
    
    
    
    @IBAction func btnCerrarSesion(_ sender: Any) {
        cerrarSesion()
    }
    
    
    @IBAction func imgCerrarSesion(_ sender: Any) {
        cerrarSesion()
    }
    
    
    func cerrarSesion()
    {
        let ser = ConsultasServiceImplService()
               let idUsuario = UserDefaults.standard.string(forKey: "idUsuario")
               let token = UserDefaults.standard.string(forKey: "token")
                 ser.cerrarSesion( idUsuario: idUsuario!, token: token!)
               
              
                   
                   UserDefaults.standard.set("", forKey:"idUsuario");
                   UserDefaults.standard.set("", forKey:"usuario");
                   UserDefaults.standard.synchronize();
                    let vc = (self.storyboard?.instantiateViewController(withIdentifier: "loginViewController"))!
                                  vc.modalPresentationStyle = .fullScreen
             
                                         self.show(vc, sender: nil)
    }
    
    
    @IBAction func imgIrFutbol(_ sender: Any) {
        regresarAPaises()
    }
    
    
    func regresarAPaises()
    {
        let sus = (self.storyboard?.instantiateViewController(withIdentifier: "paisesViewController"))!
                             sus.modalPresentationStyle = .fullScreen
        
                                    self.show(sus, sender: nil)
        
    }
    
}
