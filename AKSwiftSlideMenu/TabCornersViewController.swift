//
//  VistaPartidoViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/26/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit

class TabCornersViewController : UIViewController {
    
    @IBOutlet weak var lblVisiGlobalFavor: UILabel!
    
    @IBOutlet weak var lblH2HFinal: UILabel!
    @IBOutlet weak var lblH2HDescanso: UILabel!
    @IBOutlet weak var lblMediaSumadaFinal: UILabel!
    @IBOutlet weak var lblMediaSumada: UILabel!
    @IBOutlet weak var lblCumplioVisi: UILabel!
    @IBOutlet weak var lblCumplioLocal: UILabel!
    @IBOutlet weak var btnTempActual: UIButton!
    @IBOutlet weak var lblVisiDescanso: UILabel!
    @IBOutlet weak var lblLocalDescanso: UILabel!
    @IBOutlet weak var lblVisiFueraContra: UILabel!
    @IBOutlet weak var lblVisiFueraFavor: UILabel!
    @IBOutlet weak var lblLocalCasaContra: UILabel!
    
    @IBOutlet weak var lblLocalCasaFavor: UILabel!
    @IBOutlet weak var lblVisiGlobalContra: UILabel!
    @IBOutlet weak var lblLocalGlobalContra: UILabel!
    @IBOutlet weak var lblLocalGlobalFavor: UILabel!
    
    
    @IBOutlet weak var btnTempHist: UIButton!
    
    @IBAction func btnTempHist(_ sender: Any) {
        historico()
    }
    @IBAction func btnTempAct(_ sender: Any) {
        actual()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
           
       actual()
        
    }
    
    
    
    private func actual()
       {
           lblLocalGlobalFavor.text=datosPartido.mediaCorTALocalGlobalFavor!
           lblLocalGlobalContra.text=datosPartido.mediaCorTALocalGlobalContra!
           lblVisiGlobalFavor.text=datosPartido.mediaCorTAVisitanteGlobalFavor!
           lblVisiGlobalContra.text = datosPartido.mediaCorTAVisitanteGlobalContra!
           lblLocalCasaFavor.text = datosPartido.mediaCorTALocalCasaFavor!
           lblLocalCasaContra.text = datosPartido.mediaCorTALocalCasaContra!
           lblVisiFueraFavor.text = datosPartido.mediaCorTAVisitanteFueraFavor!
           lblVisiFueraContra.text = datosPartido.mediaCorTAVisitanteFueraContra!
           lblLocalDescanso.text = datosPartido.mediaCorTALocalDescanso!
           lblVisiDescanso.text=datosPartido.mediaCorTAVisitanteDescanso!
           lblCumplioLocal.text=datosPartido.cumplioMediaCorLocal!
           lblCumplioVisi.text=datosPartido.cumplioMediaCorVisitante!
           
           
           lblMediaSumada.text="Media Sum HT : "+datosPartido.mediaCorTASumadaDescanso!
           lblMediaSumadaFinal.text="Media Sum Final : "+datosPartido.mediaCorTASumadaFinal!
           lblH2HDescanso.text="H2H Descanso : "+datosPartido.mediaCorHHDescanso!
           lblH2HFinal.text="H2H Final : "+datosPartido.mediaCorHHFinal!
           
           
           let ut = Utils()
            btnTempActual.backgroundColor = ut.colorUIHex(hex: "252525")
           btnTempActual.setTitleColor(ut.colorUIHex(hex: "FFFFFF"), for: .normal)
            btnTempHist.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
             btnTempHist.setTitleColor(ut.colorUIHex(hex: "252525"), for: .normal)
       }
       
       
       
       private func historico()
       {
           lblLocalGlobalFavor.text=datosPartido.mediaCorHiLocalGlobalFavor!
           lblLocalGlobalContra.text=datosPartido.mediaCorHiLocalGlobalContra!
           lblVisiGlobalFavor.text=datosPartido.mediaCorHiVisitanteGlobalFavor!
           lblVisiGlobalContra.text = datosPartido.mediaCorHiVisitanteGlobalContra!
           lblLocalCasaFavor.text = datosPartido.mediaCorHiLocalCasaFavor!
           lblLocalCasaContra.text = datosPartido.mediaCorHiLocalCasaContra!
           lblVisiFueraFavor.text = datosPartido.mediaCorHiVisitanteFueraFavor!
           lblVisiFueraContra.text = datosPartido.mediaCorHiVisitanteFueraContra!
           lblLocalDescanso.text = datosPartido.mediaCorHiLocalDescanso!
           lblVisiDescanso.text=datosPartido.mediaCorHiVisitanteDescanso!
           lblCumplioLocal.text=datosPartido.cumplioMediaCorLocal!
           lblCumplioVisi.text=datosPartido.cumplioMediaCorVisitante!
           
           
           lblMediaSumada.text="Media Sum HT : "+datosPartido.mediaCorHiSumadaDescanso!
           lblMediaSumadaFinal.text="Media Sum Final : "+datosPartido.mediaCorHiSumadaFinal!
           lblH2HDescanso.text="H2H Descanso : "+datosPartido.mediaCorHHDescanso!
           lblH2HFinal.text="H2H Final : "+datosPartido.mediaCorHHFinal!
           
           
           let ut = Utils()
            btnTempHist.backgroundColor = ut.colorUIHex(hex: "252525")
           btnTempHist.setTitleColor(ut.colorUIHex(hex: "FFFFFF"), for: .normal)
            btnTempActual.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
             btnTempActual.setTitleColor(ut.colorUIHex(hex: "252525"), for: .normal)
       }
    
}
