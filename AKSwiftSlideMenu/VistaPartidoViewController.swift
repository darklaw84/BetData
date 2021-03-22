//
//  VistaPartidoViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/26/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit

class VistaPartidoViewController : UIViewController {
    
    @IBOutlet weak var logoLocal: UIImageView!
    
    @IBOutlet weak var lblLocal: UILabel!
    
    @IBOutlet weak var lblVisitante: UILabel!
    @IBOutlet weak var logoVisitante: UIImageView!
    @IBOutlet weak var lblHora: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var lblPais: UILabel!
    @IBOutlet weak var imgBanderaPais: UIImageView!
    
    @IBOutlet weak var lblResVisitante: UILabel!
    @IBOutlet weak var lblResLocal: UILabel!
    @IBOutlet weak var lblNombrePais: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var finalLocal = "-"
        var finalVisitante = "-"
        
        
        
        
        if indexBalanceSelected >= 0
        {
            
            
            var finalizado = false
            if balances[indexBalanceSelected].finalizado != nil && balances[indexBalanceSelected].finalizado == "1"
            {
                finalizado = true
            }
            
            
            if finalizado
            {
                if balances[indexBalanceSelected].finalLocal != nil
                {
                    finalLocal = balances[indexBalanceSelected].finalLocal!
                }
                if balances[indexBalanceSelected].finalVisitante != nil
                {
                    finalVisitante = balances[indexBalanceSelected].finalVisitante!
                }
            }
            
            lblResLocal.text = finalLocal
            lblResVisitante.text = finalVisitante
            
            if balances[indexBalanceSelected].equipoLocal != nil
            {
                lblLocal.text = balances[indexBalanceSelected].equipoLocal!
            }
            else{
                lblLocal.text = ""
            }
            
            if balances[indexBalanceSelected].equipoVisitante != nil
            {
                lblVisitante.text = balances[indexBalanceSelected].equipoVisitante!
            }
            else
            {
                lblVisitante.text = ""
            }
            
            if balances[indexBalanceSelected].logoLocal != nil
            {
                var urls = URL(string:balances[indexBalanceSelected].logoLocal! )
                if let data = try? Data(contentsOf: urls!) {
                    if let image = UIImage(data: data) {
                        logoLocal.image=image
                    }
                }
            }
            
            if balances[indexBalanceSelected].logoVisitante != nil
            {
                var urls = URL(string:balances[indexBalanceSelected].logoVisitante! )
                if let data = try? Data(contentsOf: urls!) {
                    if let image = UIImage(data: data) {
                        logoVisitante.image=image
                    }
                }
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateFormatterr = DateFormatter()
            dateFormatterr.dateFormat = "dd/MM/yyyy"
            let date = dateFormatter.date(from:fechaActual)!
            lblFecha.text = dateFormatterr.string(from: date)
            
            lblPais.text = balances[indexBalanceSelected].liga
            lblNombrePais.text = balances[indexBalanceSelected].pais
            
            imgBanderaPais.image = UIImage(named: balances[indexBalanceSelected].pais!+".png")
            
            let seconds = TimeZone.current.secondsFromGMT()
            
            var hora = balances[indexBalanceSelected].hora!
            
            
            hora = hora.replacingOccurrences(of: "1970-01-01", with: fechaActual)
            
            hora = hora.replacingOccurrences(of: ":00.0", with: "")
            
            
            
            let dateFormatterL = DateFormatter()
            dateFormatterL.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let fechaPartido = dateFormatterL.date(from:hora)!
            let hours = seconds/3600
            var dateComponent = DateComponents()
            
            dateComponent.hour = hours
            
            
            let futureDate = Calendar.current.date(byAdding: dateComponent, to: fechaPartido)
            
            let dateFormatterH = DateFormatter()
            dateFormatterH.dateFormat = "HH:mm"
            
            
            
            
            lblHora.text=dateFormatterH.string(from: futureDate!)
        }
        else if (indexApuestaLocaSelected >= 0)
        {
            
            
            var finalizado = false
            if locos[indexApuestaLocaSelected].finalizado != nil && locos[indexApuestaLocaSelected].finalizado == "1"
            {
                finalizado = true
            }
            
            
            if finalizado
            {
                if locos[indexApuestaLocaSelected].finalLocal != nil
                {
                    finalLocal = locos[indexApuestaLocaSelected].finalLocal!
                }
                if locos[indexApuestaLocaSelected].finalVisitante != nil
                {
                    finalVisitante = locos[indexApuestaLocaSelected].finalVisitante!
                }
            }
            
            lblResLocal.text = finalLocal
            lblResVisitante.text = finalVisitante
            
            
            if locos[indexApuestaLocaSelected].equipoLocal != nil
            {
                lblLocal.text = locos[indexApuestaLocaSelected].equipoLocal!
            }
            else{
                lblLocal.text = ""
            }
            
            if locos[indexApuestaLocaSelected].equipoVisitante != nil
            {
                lblVisitante.text = locos[indexApuestaLocaSelected].equipoVisitante!
            }
            else
            {
                lblVisitante.text = ""
            }
            
            if locos[indexApuestaLocaSelected].logoLocal != nil
            {
                var urls = URL(string:locos[indexApuestaLocaSelected].logoLocal! )
                if let data = try? Data(contentsOf: urls!) {
                    if let image = UIImage(data: data) {
                        logoLocal.image=image
                    }
                }
            }
            
            if locos[indexApuestaLocaSelected].logoVisitante != nil
            {
                var urls = URL(string:locos[indexApuestaLocaSelected].logoVisitante! )
                if let data = try? Data(contentsOf: urls!) {
                    if let image = UIImage(data: data) {
                        logoVisitante.image=image
                    }
                }
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateFormatterr = DateFormatter()
            dateFormatterr.dateFormat = "dd/MM/yyyy"
            let date = dateFormatter.date(from:fechaActual)!
            lblFecha.text = dateFormatterr.string(from: date)
            
            lblPais.text = locos[indexApuestaLocaSelected].liga
            lblNombrePais.text = locos[indexApuestaLocaSelected].pais
            
            imgBanderaPais.image = UIImage(named: locos[indexApuestaLocaSelected].pais!+".png")
            
            let seconds = TimeZone.current.secondsFromGMT()
            
            var hora = locos[indexApuestaLocaSelected].hora!
            
            
            hora = hora.replacingOccurrences(of: "1970-01-01", with: fechaActual)
            
            hora = hora.replacingOccurrences(of: ":00.0", with: "")
            
            
            
            let dateFormatterL = DateFormatter()
            dateFormatterL.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let fechaPartido = dateFormatterL.date(from:hora)!
            let hours = seconds/3600
            var dateComponent = DateComponents()
            
            dateComponent.hour = hours
            
            
            let futureDate = Calendar.current.date(byAdding: dateComponent, to: fechaPartido)
            
            let dateFormatterH = DateFormatter()
            dateFormatterH.dateFormat = "HH:mm"
            
            
            
            
            lblHora.text=dateFormatterH.string(from: futureDate!)
        }
        else if (indexEventosSelected >= 0)
        {
            
            var finalizado = false
            if eventos[indexEventosSelected].finalizado != nil && eventos[indexEventosSelected].finalizado == "1"
            {
                finalizado = true
            }
            
            
            if finalizado
            {
                if eventos[indexEventosSelected].finalLocal != nil
                {
                    finalLocal = eventos[indexEventosSelected].finalLocal!
                }
                if eventos[indexEventosSelected].finalVisitante != nil
                {
                    finalVisitante = eventos[indexEventosSelected].finalVisitante!
                }
            }
            
            lblResLocal.text = finalLocal
            lblResVisitante.text = finalVisitante
            
            if eventos[indexEventosSelected].equipoLocal != nil
            {
                lblLocal.text = eventos[indexEventosSelected].equipoLocal!
            }
            else{
                lblLocal.text = ""
            }
            
            if eventos[indexEventosSelected].equipoVisitante != nil
            {
                lblVisitante.text = eventos[indexEventosSelected].equipoVisitante!
            }
            else
            {
                lblVisitante.text = ""
            }
            
            if eventos[indexEventosSelected].logoLocal != nil
            {
                var urls = URL(string:eventos[indexEventosSelected].logoLocal! )
                if let data = try? Data(contentsOf: urls!) {
                    if let image = UIImage(data: data) {
                        logoLocal.image=image
                    }
                }
            }
            
            if eventos[indexEventosSelected].logoVisitante != nil
            {
                var urls = URL(string:eventos[indexEventosSelected].logoVisitante! )
                if let data = try? Data(contentsOf: urls!) {
                    if let image = UIImage(data: data) {
                        logoVisitante.image=image
                    }
                }
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateFormatterr = DateFormatter()
            dateFormatterr.dateFormat = "dd/MM/yyyy"
            let date = dateFormatter.date(from:fechaActual)!
            lblFecha.text = dateFormatterr.string(from: date)
            
            lblPais.text = eventos[indexEventosSelected].liga
            lblNombrePais.text = eventos[indexEventosSelected].pais
            
            imgBanderaPais.image = UIImage(named: eventos[indexEventosSelected].pais!+".png")
            
            let seconds = TimeZone.current.secondsFromGMT()
            
            var hora = eventos[indexEventosSelected].hora!
            
            
            hora = hora.replacingOccurrences(of: "1970-01-01", with: fechaActual)
            
            hora = hora.replacingOccurrences(of: ":00.0", with: "")
            
            
            
            let dateFormatterL = DateFormatter()
            dateFormatterL.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let fechaPartido = dateFormatterL.date(from:hora)!
            let hours = seconds/3600
            var dateComponent = DateComponents()
            
            dateComponent.hour = hours
            
            
            let futureDate = Calendar.current.date(byAdding: dateComponent, to: fechaPartido)
            
            let dateFormatterH = DateFormatter()
            dateFormatterH.dateFormat = "HH:mm"
            
            
            
            
            lblHora.text=dateFormatterH.string(from: futureDate!)
        }
        
        
        
    }
    
    
}
