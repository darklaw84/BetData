//
//  VistaPartidoViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/26/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit

class TabTarjetasViewController : UIViewController {
    
    @IBOutlet weak var lblVisiGlobal: UILabel!
    @IBOutlet weak var lblLocalCasa: UILabel!
    
    @IBOutlet weak var lblHistH2H: UILabel!
  
    @IBOutlet weak var lblCumplioMedVisi: UILabel!
    @IBOutlet weak var lblCumplioMedLocal: UILabel!
    @IBOutlet weak var lblVisiFuera: UILabel!
    @IBOutlet weak var lblVisiCasa: UILabel!
 
    @IBOutlet weak var lblLocalFuera: UILabel!
    @IBOutlet weak var lblLocalGlobal: UILabel!
    
    @IBOutlet weak var btnTempHist: UIButton!
    @IBOutlet weak var btnTempAct: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
           
        
        
        actual()
        
    }
    
    private func actual()
    {
        lblLocalCasa.text="Casa : "+datosPartido.mediaTarTALocalCasa!
        lblLocalFuera.text="Fuera : "+datosPartido.mediaTarTALocalFuera!
        lblLocalGlobal.text="Global : "+datosPartido.mediaTarTALocalGlobal!
        lblCumplioMedLocal.text=datosPartido.cumplioMediaTarLocal!
        
        
        lblVisiCasa.text="Casa : "+datosPartido.mediaTarTAVisitanteCasa!
        lblVisiFuera.text="Fuera : "+datosPartido.mediaTarTAVisitanteFuera!
        lblVisiGlobal.text="Global : "+datosPartido.mediaTarTAVisitanteGlobal!
        lblCumplioMedVisi.text=datosPartido.cumplioMediaTarVisitante!
        
        lblHistH2H.text = "Historica de sus H2H : "+datosPartido.mediaTarjetasHistH2H!
        
        let ut = Utils()
         btnTempAct.backgroundColor = ut.colorUIHex(hex: "252525")
        btnTempAct.setTitleColor(ut.colorUIHex(hex: "FFFFFF"), for: .normal)
         btnTempHist.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
          btnTempHist.setTitleColor(ut.colorUIHex(hex: "252525"), for: .normal)
    }
    
    private func historico()
    {
        lblLocalCasa.text="Casa : "+datosPartido.mediaTarHiLocalCasa!
        lblLocalFuera.text="Fuera : "+datosPartido.mediaTarHiLocalFuera!
        lblLocalGlobal.text="Global : "+datosPartido.mediaTarHiLocalGlobal!
        lblCumplioMedLocal.text=datosPartido.cumplioMediaTarLocal!
        
        
        lblVisiCasa.text="Casa : "+datosPartido.mediaTarHiVisitanteCasa!
        lblVisiFuera.text="Fuera : "+datosPartido.mediaTarHiVisitanteFuera!
        lblVisiGlobal.text="Global : "+datosPartido.mediaTarHiVisitanteGlobal!
        lblCumplioMedVisi.text=datosPartido.cumplioMediaTarVisitante!
        
        lblHistH2H.text = "Historica de sus H2H : "+datosPartido.mediaTarjetasHistH2H!
         let ut = Utils()
                btnTempHist.backgroundColor = ut.colorUIHex(hex: "252525")
               btnTempHist.setTitleColor(ut.colorUIHex(hex: "FFFFFF"), for: .normal)
                btnTempAct.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
                 btnTempAct.setTitleColor(ut.colorUIHex(hex: "252525"), for: .normal)
    }
    
    @IBAction func btnTempHistorica(_ sender: Any) {
        historico()
    }
    
    @IBAction func btnTempAct(_ sender: Any) {
        actual()
    }
    
    
    
}
