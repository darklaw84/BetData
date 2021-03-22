//
//  VistaPartidoViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/26/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit

class PartidoTabViewController : UIViewController {
    
    @IBOutlet weak var logoLocal: UIImageView!
    
    @IBOutlet weak var lblLocal: UILabel!
    
    @IBOutlet weak var lblVisitante: UILabel!
    @IBOutlet weak var logoVisitante: UIImageView!
    @IBOutlet weak var lblHora: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var lblPais: UILabel!
   
    
    @IBOutlet weak var btnTarjetas: UIButton!
    
    
    @IBOutlet weak var btnRachas: UIButton!
    @IBOutlet weak var btnCorners: UIButton!
    @IBOutlet weak var btnGoles: UIButton!
    
    @IBOutlet weak var contCorners: UIView!
    @IBOutlet weak var contGoles: UIView!
    
    @IBOutlet weak var contRachas: UIView!
    @IBOutlet weak var contTarjetas: UIView!
    
    @IBAction func btnRachas(_ sender: Any) {
       mostrarRachas()
        
    }
    
    @IBAction func btnCorners(_ sender: Any) {
       mostrarCorners()
    }
    @IBAction func btnGoles(_ sender: Any) {
       mostrarGoles()
        
        
    }
    @IBAction func btnTarjetas(_ sender: Any) {
       
        mostrarTarjetas()
        
    }
    
    func mostrarTarjetas()
    {
         let ut = Utils()
                btnTarjetas.backgroundColor = ut.colorUIHex(hex: "ff9e16")
        btnGoles.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
        btnRachas.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
        btnCorners.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
        btnTarjetas.setTitleColor(ut.colorUIHex(hex: "FFFFFF"), for: .normal)
               btnGoles.setTitleColor(ut.colorUIHex(hex: "ff9e16"), for: .normal)
               btnCorners.setTitleColor(ut.colorUIHex(hex: "ff9e16"), for: .normal)
               btnRachas.setTitleColor(ut.colorUIHex(hex: "ff9e16"), for: .normal)
              contGoles.alpha=0
              contTarjetas.alpha=1
               contRachas.alpha=0
               contCorners.alpha=0
                
    }
    
    func mostrarGoles()
    {
         let ut = Utils()
                btnTarjetas.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
        btnGoles.backgroundColor = ut.colorUIHex(hex: "ff9e16")
        btnRachas.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
        btnCorners.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
        btnTarjetas.setTitleColor(ut.colorUIHex(hex: "ff9e16"), for: .normal)
        btnGoles.setTitleColor(ut.colorUIHex(hex: "FFFFFF"), for: .normal)
        btnCorners.setTitleColor(ut.colorUIHex(hex: "ff9e16"), for: .normal)
        btnRachas.setTitleColor(ut.colorUIHex(hex: "ff9e16"), for: .normal)
              contGoles.alpha=1
              contTarjetas.alpha=0
               contRachas.alpha=0
               contCorners.alpha=0
                
    }
    
    func mostrarCorners()
    {
         let ut = Utils()
                btnTarjetas.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
        btnGoles.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
        btnRachas.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
        btnCorners.backgroundColor = ut.colorUIHex(hex: "ff9e16")
        btnTarjetas.setTitleColor(ut.colorUIHex(hex: "ff9e16"), for: .normal)
        btnGoles.setTitleColor(ut.colorUIHex(hex: "ff9e16"), for: .normal)
        btnCorners.setTitleColor(ut.colorUIHex(hex: "FFFFFF"), for: .normal)
        btnRachas.setTitleColor(ut.colorUIHex(hex: "ff9e16"), for: .normal)
              contGoles.alpha=0
              contTarjetas.alpha=0
               contRachas.alpha=0
               contCorners.alpha=1
                
    }
    
    func mostrarRachas()
    {
         let ut = Utils()
                btnTarjetas.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
        btnGoles.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
        btnRachas.backgroundColor = ut.colorUIHex(hex: "ff9e16")
        btnCorners.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
        btnTarjetas.setTitleColor(ut.colorUIHex(hex: "ff9e16"), for: .normal)
        btnGoles.setTitleColor(ut.colorUIHex(hex: "ff9e16"), for: .normal)
        btnCorners.setTitleColor(ut.colorUIHex(hex: "ff9e16"), for: .normal)
        btnRachas.setTitleColor(ut.colorUIHex(hex: "FFFFFF"), for: .normal)
              contGoles.alpha=0
              contTarjetas.alpha=0
               contRachas.alpha=1
               contCorners.alpha=0
                
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        
        lblLocal.text = partidos[indexPartidoSelected].equipoLocal!
        lblVisitante.text = partidos[indexPartidoSelected].equipoVisitante!
        
        var urls = URL(string:partidos[indexPartidoSelected].logoLocal! )
        if let data = try? Data(contentsOf: urls!) {
            if let image = UIImage(data: data) {
                logoLocal.image=image
            }
        }
        
        urls = URL(string:partidos[indexPartidoSelected].logoVisitante! )
        if let data = try? Data(contentsOf: urls!) {
            if let image = UIImage(data: data) {
                logoVisitante.image=image
            }
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateFormatterr = DateFormatter()
        dateFormatterr.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.date(from:fechaActual)!
        lblFecha.text = dateFormatterr.string(from: date)
        
        lblPais.text = partidos[indexPartidoSelected].liga
      
        
        
        mostrarGoles()
       
        
    }
    
    
}
