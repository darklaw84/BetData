//
//  VistaPartidoViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/26/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit

class TabRachasViewController : UIViewController {
    
    
    @IBOutlet weak var btnTempAct: UIButton!
    @IBOutlet weak var btnTempHist: UIButton!
    @IBOutlet weak var lblVisMaxGanGlo: UILabel!
    
    @IBOutlet weak var lblVisMaxSinGanFue: UILabel!
    @IBOutlet weak var lblLocMaxSinGanFue: UILabel!
    @IBOutlet weak var lblVisMaxSinGanCas: UILabel!
    @IBOutlet weak var lblLocMaxSinGanCas: UILabel!
    @IBOutlet weak var lblVisMaxSinGanGlo: UILabel!
    @IBOutlet weak var lblLocMaxSinGanGlo: UILabel!
    @IBOutlet weak var lblVisMaxPerFue: UILabel!
    @IBOutlet weak var lblLocMaxPerFue: UILabel!
    @IBOutlet weak var lblVisMaxPerCas: UILabel!
    @IBOutlet weak var lblLocMaxPerCas: UILabel!
    @IBOutlet weak var lblVisMaxPerGlo: UILabel!
    @IBOutlet weak var lblLocMaxPerGlo: UILabel!
    @IBOutlet weak var lblVisMaxSinPerFue: UILabel!
    @IBOutlet weak var lblLocMaxSinPerFue: UILabel!
    @IBOutlet weak var lblVisMaxSinPerCas: UILabel!
    @IBOutlet weak var lblLocMaxSinPerCas: UILabel!
    @IBOutlet weak var lblVisMaxSinPerGlo: UILabel!
    @IBOutlet weak var lblLocMaxSinPerGlo: UILabel!
    @IBOutlet weak var lblVisMaxGanFue: UILabel!
    @IBOutlet weak var lblLocMaxGanFue: UILabel!
    @IBOutlet weak var lblVisMaxGanCas: UILabel!
    @IBOutlet weak var lblLocMaxGanCas: UILabel!
    @IBOutlet weak var lblLocMaxGanGlo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
           
       actual()
        
    }
    
    @IBAction func btnTempAct(_ sender: Any) {
        actual()
    }
    @IBAction func btnTempHist(_ sender: Any) {
        historico()
    }
    
    
    func actual()
    {
        lblLocMaxGanGlo.text = datosPartido.rachaTALoPartMaxGanCF
        lblLocMaxGanCas.text = datosPartido.rachaTALoPartMaxGanCasa
        lblLocMaxGanFue.text = datosPartido.rachaTALoPartMaxGanFuera
        lblLocMaxSinPerGlo.text = datosPartido.rachaTALoPartMaxSinPerCF
        lblLocMaxSinPerCas.text = datosPartido.rachaTALoPartMaxSinPerCasa
        lblLocMaxSinPerFue.text = datosPartido.rachaTALoPartMaxSinPerFuera
        lblLocMaxPerGlo.text = datosPartido.rachaTALoPartMaxPerCF
        lblLocMaxPerCas.text = datosPartido.rachaTALoPartMaxPerCasa
        lblLocMaxPerFue.text = datosPartido.rachaTALoPartMaxPerFuera
        lblLocMaxSinGanGlo.text = datosPartido.rachaTALoPartMaxSinGanCF
        lblLocMaxSinGanCas.text = datosPartido.rachaTALoPartMaxSinGanCasa
        lblLocMaxSinGanFue.text = datosPartido.rachaTALoPartMaxSinGanFuera
        
        
        lblVisMaxGanGlo.text = datosPartido.rachaTAViPartMaxGanCF
        lblVisMaxGanCas.text = datosPartido.rachaTAViPartMaxGanCasa
        lblVisMaxGanFue.text = datosPartido.rachaTAViPartMaxGanFuera
        lblVisMaxSinPerGlo.text = datosPartido.rachaTAViPartMaxSinPerCF
        lblVisMaxSinPerCas.text = datosPartido.rachaTAViPartMaxSinPerCasa
        lblVisMaxSinPerFue.text = datosPartido.rachaTAViPartMaxSinPerFuera
        lblVisMaxPerGlo.text = datosPartido.rachaTAViPartMaxPerCF
        lblVisMaxPerCas.text = datosPartido.rachaTAViPartMaxPerCasa
        lblVisMaxPerFue.text = datosPartido.rachaTAViPartMaxPerFuera
        lblVisMaxSinGanGlo.text = datosPartido.rachaTAViPartMaxSinGanCF
        lblVisMaxSinGanCas.text = datosPartido.rachaTAViPartMaxSinGanCasa
        lblVisMaxSinGanFue.text = datosPartido.rachaTAViPartMaxSinGanFuera
        
        let ut = Utils()
         btnTempAct.backgroundColor = ut.colorUIHex(hex: "252525")
        btnTempAct.setTitleColor(ut.colorUIHex(hex: "FFFFFF"), for: .normal)
         btnTempHist.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
          btnTempHist.setTitleColor(ut.colorUIHex(hex: "252525"), for: .normal)
        
        
        
    }
    
    
    func historico()
       {
           lblLocMaxGanGlo.text = datosPartido.rachaHiLoPartMaxGanCF
           lblLocMaxGanCas.text = datosPartido.rachaHiLoPartMaxGanCasa
           lblLocMaxGanFue.text = datosPartido.rachaHiLoPartMaxGanFuera
           lblLocMaxSinPerGlo.text = datosPartido.rachaHiLoPartMaxSinPerCF
           lblLocMaxSinPerCas.text = datosPartido.rachaHiLoPartMaxSinPerCasa
           lblLocMaxSinPerFue.text = datosPartido.rachaHiLoPartMaxSinPerFuera
           lblLocMaxPerGlo.text = datosPartido.rachaHiLoPartMaxPerCF
           lblLocMaxPerCas.text = datosPartido.rachaHiLoPartMaxPerCasa
           lblLocMaxPerFue.text = datosPartido.rachaHiLoPartMaxPerFuera
           lblLocMaxSinGanGlo.text = datosPartido.rachaHiLoPartMaxSinGanCF
           lblLocMaxSinGanCas.text = datosPartido.rachaHiLoPartMaxSinGanCasa
           lblLocMaxSinGanFue.text = datosPartido.rachaHiLoPartMaxSinGanFuera
           
           
           lblVisMaxGanGlo.text = datosPartido.rachaHiViPartMaxGanCF
           lblVisMaxGanCas.text = datosPartido.rachaHiViPartMaxGanCasa
           lblVisMaxGanFue.text = datosPartido.rachaHiViPartMaxGanFuera
           lblVisMaxSinPerGlo.text = datosPartido.rachaHiViPartMaxSinPerCF
           lblVisMaxSinPerCas.text = datosPartido.rachaHiViPartMaxSinPerCasa
           lblVisMaxSinPerFue.text = datosPartido.rachaHiViPartMaxSinPerFuera
           lblVisMaxPerGlo.text = datosPartido.rachaHiViPartMaxPerCF
           lblVisMaxPerCas.text = datosPartido.rachaHiViPartMaxPerCasa
           lblVisMaxPerFue.text = datosPartido.rachaHiViPartMaxPerFuera
           lblVisMaxSinGanGlo.text = datosPartido.rachaHiViPartMaxSinGanCF
           lblVisMaxSinGanCas.text = datosPartido.rachaHiViPartMaxSinGanCasa
           lblVisMaxSinGanFue.text = datosPartido.rachaHiViPartMaxSinGanFuera
           
          
           let ut = Utils()
            btnTempHist.backgroundColor = ut.colorUIHex(hex: "252525")
           btnTempHist.setTitleColor(ut.colorUIHex(hex: "FFFFFF"), for: .normal)
            btnTempAct.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
             btnTempAct.setTitleColor(ut.colorUIHex(hex: "252525"), for: .normal)
           
           
           
       }
    
    
    
}
