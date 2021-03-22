//
//  VistaPartidoViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/26/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit

class TabGolesViewController : UIViewController {
    
    
   
    
    @IBOutlet weak var lblLocalGlobalFavor: UILabel!
    
    @IBOutlet weak var btnTempHist: UIButton!
    @IBOutlet weak var btnTempAct: UIButton!
    @IBOutlet weak var lblVisiGlobalContra: UILabel!
    @IBOutlet weak var lblVisiGlobalFavor: UILabel!
    @IBOutlet weak var lblLocalGlobalContra: UILabel!
    
    @IBOutlet weak var lblH2HFinal: UILabel!
    @IBOutlet weak var lblH2HDescanso: UILabel!
    @IBOutlet weak var lblMediaSumadaFinal: UILabel!
    @IBOutlet weak var lblMediaSumada: UILabel!
    @IBOutlet weak var lblCumplioVisi: UILabel!
    @IBOutlet weak var lblCumplioLocal: UILabel!
    @IBOutlet weak var lblVisiDescanso: UILabel!
    @IBOutlet weak var lblLocalDescanso: UILabel!
    @IBOutlet weak var lblVisiFueraContra: UILabel!
    @IBOutlet weak var lblVisiFueraFavor: UILabel!
    @IBOutlet weak var lblLocalCasaContra: UILabel!
    @IBOutlet weak var lblLocalCasaFavor: UILabel!
    
    
    
    
    @IBAction func btnTempActual(_ sender: Any) {
        actual()
       
    }
    
    
    @IBAction func btnTempHistorica(_ sender: Any) {
        historico()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
       actual()
        
    }
    
    
    
    
    
    private func actual()
    {
        lblLocalGlobalFavor.text=datosPartido.mediaGolTALocalGlobalFavor!
        lblLocalGlobalContra.text=datosPartido.mediaGolTALocalGlobalContra!
        lblVisiGlobalFavor.text=datosPartido.mediaGolTAVisitanteGlobalFavor!
        lblVisiGlobalContra.text = datosPartido.mediaGolTAVisitanteGlobalContra!
        lblLocalCasaFavor.text = datosPartido.mediaGolTALocalCasaFavor!
        lblLocalCasaContra.text = datosPartido.mediaGolTALocalCasaContra!
        lblVisiFueraFavor.text = datosPartido.mediaGolTAVisitanteFueraFavor!
        lblVisiFueraContra.text = datosPartido.mediaGolTAVisitanteFueraContra!
        lblLocalDescanso.text = datosPartido.mediaGolTALocalDescanso!
        lblVisiDescanso.text=datosPartido.mediaGolTAVisitanteDescanso!
        lblCumplioLocal.text=datosPartido.cumplioMediaGolLocal!
        lblCumplioVisi.text=datosPartido.cumplioMediaGolVisitante!
        
        
        lblMediaSumada.text="Media Sum HT : "+datosPartido.mediaGolTASumadaDescanso!
        lblMediaSumadaFinal.text="Media Sum Final : "+datosPartido.mediaGolTASumadaFinal!
        lblH2HDescanso.text="H2H Descanso : "+datosPartido.mediaGolH2HDescanso!
        lblH2HFinal.text="H2H Final : "+datosPartido.mediaGolH2HFinal!
        
        
        let ut = Utils()
         btnTempAct.backgroundColor = ut.colorUIHex(hex: "252525")
        btnTempAct.setTitleColor(ut.colorUIHex(hex: "FFFFFF"), for: .normal)
         btnTempHist.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
          btnTempHist.setTitleColor(ut.colorUIHex(hex: "252525"), for: .normal)
    }
    
    
    
    private func historico()
    {
        lblLocalGlobalFavor.text=datosPartido.mediaGolHiLocalGlobalFavor!
        lblLocalGlobalContra.text=datosPartido.mediaGolHiLocalGlobalContra!
        lblVisiGlobalFavor.text=datosPartido.mediaGolHiVisitanteGlobalFavor!
        lblVisiGlobalContra.text = datosPartido.mediaGolHiVisitanteGlobalContra!
        lblLocalCasaFavor.text = datosPartido.mediaGolHiLocalCasaFavor!
        lblLocalCasaContra.text = datosPartido.mediaGolHiLocalCasaContra!
        lblVisiFueraFavor.text = datosPartido.mediaGolHiVisitanteFueraFavor!
        lblVisiFueraContra.text = datosPartido.mediaGolHiVisitanteFueraContra!
        lblLocalDescanso.text = datosPartido.mediaGolHiLocalDescanso!
        lblVisiDescanso.text=datosPartido.mediaGolHiVisitanteDescanso!
        lblCumplioLocal.text=datosPartido.cumplioMediaGolLocal!
        lblCumplioVisi.text=datosPartido.cumplioMediaGolVisitante!
        
        
        lblMediaSumada.text="Media Sum HT : "+datosPartido.mediaGolHiSumadaDescanso!
        lblMediaSumadaFinal.text="Media Sum Final : "+datosPartido.mediaGolHiSumadaFinal!
        lblH2HDescanso.text="H2H Descanso : "+datosPartido.mediaGolH2HDescanso!
        lblH2HFinal.text="H2H Final : "+datosPartido.mediaGolH2HFinal!
        
        
        let ut = Utils()
         btnTempHist.backgroundColor = ut.colorUIHex(hex: "252525")
        btnTempHist.setTitleColor(ut.colorUIHex(hex: "FFFFFF"), for: .normal)
         btnTempAct.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
          btnTempAct.setTitleColor(ut.colorUIHex(hex: "252525"), for: .normal)
    }
    
    
}
