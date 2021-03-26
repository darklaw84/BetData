

import UIKit

var eventos = [EstructuraEquiposPartido]()
class EventosViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return eventos.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexEventosSelected=indexPath.row
        indexApuestaLocaSelected = -1
        indexBalanceSelected = -1
        
        performSegue(withIdentifier: "irVistaPartido", sender: "self")
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let ut = Utils()
        let cell = Bundle.main.loadNibNamed("BalancesTVCTableViewCell", owner: self, options: nil)?.first as! BalancesTVCTableViewCell
        
        cell.txtLiga.text=eventos[indexPath.row].liga
        var equipoLocal = ""
        if eventos[indexPath.row].equipoLocal == nil
        {
            equipoLocal = ""
        }
        else
        {
            equipoLocal = eventos[indexPath.row].equipoLocal!
        }
        var equipoVisitante = ""
        if eventos[indexPath.row].equipoVisitante == nil
        {
            equipoVisitante = ""
        }
        else
        {
            equipoVisitante = eventos[indexPath.row].equipoVisitante!
        }
        cell.txtPartido.text = equipoLocal + " - " + equipoVisitante
        cell.imgBandera.image = UIImage(named: eventos[indexPath.row].pais!+".png")
        cell.txtBalance.text = eventos[indexPath.row].balance
        
        if eventos[indexPath.row].cuotaPartido != nil
        {
            cell.txtCuota.text = eventos[indexPath.row].cuotaPartido
        }
        else
        {
            if eventos[indexPath.row].cuota != nil
            {
                cell.txtCuota.text = eventos[indexPath.row].cuota
            }
            else
            {
                cell.txtCuota.text = ""
            }
        }
        
        
        if indexPath.row % 2 == 0
        {
            cell.backgroundColor = ut.colorUIHex(hex: "F6F3F0")
            cell.txtLiga.backgroundColor=ut.colorUIHex(hex: "F6F3F0")
            cell.txtPartido.backgroundColor=ut.colorUIHex(hex: "F6F3F0")
            cell.txtBalance.backgroundColor=ut.colorUIHex(hex: "F6F3F0")
            cell.txtCuota.backgroundColor=ut.colorUIHex(hex: "F6F3F0")
        }
        else
        {
            cell.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
        }
        
        let admin = eventos[indexPath.row].admin
        let tipoRes = eventos[indexPath.row].tipoResPartido
        if admin != nil && admin == "1"
        {
            
            if tipoRes != nil && tipoRes != ""
            {
                cell.backgroundColor = ut.colorUIHex(hex: obtenerColorTipoResPartido(tipoResPartido: tipoRes!))
                cell.txtLiga.backgroundColor=ut.colorUIHex(hex: obtenerColorTipoResPartido(tipoResPartido: tipoRes!))
                cell.txtPartido.backgroundColor=ut.colorUIHex(hex: obtenerColorTipoResPartido(tipoResPartido: tipoRes!))
                cell.txtBalance.backgroundColor=ut.colorUIHex(hex: obtenerColorTipoResPartido(tipoResPartido: tipoRes!))
                cell.txtCuota.backgroundColor=ut.colorUIHex(hex: obtenerColorTipoResPartido(tipoResPartido: tipoRes!))
                cell.txtLiga.textColor=ut.colorUIHex(hex: obtenerColorTexto(tipoResPartido: tipoRes!))
                cell.txtPartido.textColor=ut.colorUIHex(hex: obtenerColorTexto(tipoResPartido: tipoRes!))
                cell.txtBalance.textColor=ut.colorUIHex(hex: obtenerColorTexto(tipoResPartido: tipoRes!))
                cell.txtCuota.textColor=ut.colorUIHex(hex: obtenerColorTexto(tipoResPartido: tipoRes!))
                
            }
        }
        else
        {
            if tipoRes != nil && tipoRes != ""
            {
                cell.backgroundColor = ut.colorUIHex(hex:"CBFDC8")
                cell.txtLiga.backgroundColor=ut.colorUIHex(hex:"CBFDC8")
                cell.txtPartido.backgroundColor=ut.colorUIHex(hex:"CBFDC8")
                cell.txtBalance.backgroundColor=ut.colorUIHex(hex:"CBFDC8")
                cell.txtCuota.backgroundColor=ut.colorUIHex(hex:"CBFDC8")
                cell.txtLiga.textColor=ut.colorUIHex(hex:"000000")
                cell.txtPartido.textColor=ut.colorUIHex(hex:"000000")
                cell.txtBalance.textColor=ut.colorUIHex(hex:"000000")
                cell.txtCuota.textColor=ut.colorUIHex(hex:"000000")
            }
        }
        
        let acertado = eventos[indexPath.row].acertado
        
        if acertado != nil && acertado == "1"
        {
            cell.imgAcertado.isHidden = false
        }
        else if acertado != nil && acertado == "N"
        {
            cell.imgAcertado.isHidden = false
            cell.imgAcertado.image = UIImage(named: "nulo.png")
        }
        else
        {
            cell.imgAcertado.isHidden = true
            
        }
        
        
        
        return cell
    }
    
    func obtenerColorTexto(tipoResPartido: String )->String
    {
        var color = ""
        
        if tipoResPartido.toInt()! <= 8 || tipoResPartido.toInt()! == 13 || tipoResPartido.toInt()! == 14
            || tipoResPartido.toInt()! == 15 || tipoResPartido.toInt()! == 16
        {
            color = "000000"
        }
        else
        {
            color = "FFFFFF"
        }
        return color
    }
    
    func obtenerColorTipoResPartido (tipoResPartido: String) -> String
    {
        var color = "FFFFFF"
        
        if tipoResPartido == "1"
        {
            color = "ADD6FE"
        }
        else if tipoResPartido == "2"
        {
            color = "EAADFE"
        }
        else if tipoResPartido == "3"
        {
            color = "FD78D9"
        }
        else if tipoResPartido == "4"
        {
            color = "FEFE5E"
        }
        else if tipoResPartido == "5"
        {
            color = "AEFDA4"
        }
        else if tipoResPartido == "6"
        {
            color = "FF3434"
        }
        else if tipoResPartido == "7"
        {
            color = "FF9634"
        }
        else if tipoResPartido == "8"
        {
            color = "D1B193"
        }
        else if tipoResPartido == "9"
        {
            color = "B0192D"
        }
        else if tipoResPartido == "10"
        {
            color = "4E4BA7"
        }
        else if tipoResPartido == "11"
        {
            color = "0B6011"
        }
        else if tipoResPartido == "12"
        {
            color = "4A057D"
        }
        else if tipoResPartido == "13"
        {
            color = "F7C406"
        }
        else if tipoResPartido == "14"
        {
            color = "F7C406"
        }
        else if tipoResPartido == "15"
        {
            color = "F7C406"
        }
        return color
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addSlideMenuButton()
        addCalendarButton(fecha: dia)
        armarEventos()
        
        // Do any additional setup after loading the view.
    }
    
    
    func armarEventos()
    {
        eventos = [EstructuraEquiposPartido]()
        
        
        
        var dobleOportunidad = [EstructuraEquiposPartido]()
        
        dobleOportunidad.append(contentsOf: doble1X)
        dobleOportunidad.append(contentsOf: doble12)
        dobleOportunidad.append(contentsOf: dobleX2)
        
        
        
        if dobleOportunidad.count > 0
        {
            for p in dobleOportunidad
            {
                
                var finalLocal = 0
                if p.finalLocal != nil
                {
                    finalLocal = p.finalLocal!.toInt()!
                }
                var finalVisitante = 0
                if p.finalVisitante != nil
                {
                    finalVisitante = p.finalVisitante!.toInt()!
                }
                
                var finalizado = false
                if p.finalizado != nil && p.finalizado == "1"
                {
                    finalizado = true
                }
                
                
                var cuotas = [CuotaDTO]()
                
                if p.cuotas != nil && p.cuotas!.lengthOfBytes(using: String.Encoding.utf8 ) > 0
                {
                    let datos = p.cuotas!.split(separator: ",")
                    for d in datos
                    {
                        
                        let dats = d.split(separator: "|")
                        if dats.count > 1
                        {
                            let cuota = CuotaDTO(pronostico:String(dats[0]),cuota: String(dats[1]))
                            cuotas.append(cuota)
                        }
                        
                    }
                }
                
                
                
                if p.resultadoPartido != nil && p.resultadoPartido!.lengthOfBytes(using: String.Encoding.utf8) > 0
                {
                    
                    var np =  EstructuraEquiposPartido(equipoLocal: "", equipoVisitante: "", idPartido: "", logoLocal: "", logoVisitante: "", hora: "", balance: "", idEquipoFavorito: "", cuotaPartido: "", resultadoPartido: "", puntosResultadoPartido: "", golesAlDescanso: "", golesAlFinal: "", golesPositivo: "", golesNegativo: "", tarjetasPositivo: "", tipoResPartido: "", tarjetasNegativo: "", cornersPositivo: "", cornesNegativo: "", diferenciaExcesivaClasificacion: "", ceresultado: "", cecuota: "", limites: "", idEquipoLocal: "", idEquipoVisitante: "", poissongolesdescanso: "", poissongolesfinal: "", poissondobleoportunidad: "", poissonmarcanlosdos: "", poissoncornersdescanso: "", poissoncornesfinal: "", pais: "", idLiga: "", liga: "", probabilidad: "", pronostico: "", cuotas: "", cuota: "", golesPositivoMT: "", golesNegativoMT: "", poissongolesdescansonegativo: "", cumplioMediaGolMTLocal: "", cumplioMediaGolMTVisitante: "", tipoMT: "", localvisitante: "", mediaGolVisitanteComoVisitante: "", mediaGolhiLocalFinal: "", cumplioMediaGolVisitante: "", cumplioMediaGolLocal: "", finalLocal: "", finalVisitante: "", acertado: "", finalizado: "", admin: "")
                    
                    np.equipoLocal = p.equipoLocal
                    np.equipoVisitante = p.equipoVisitante
                    np.logoLocal = p.logoLocal
                    np.logoVisitante = p.logoVisitante
                    np.pais = p.pais
                    np.liga = p.liga
                    np.hora = p.hora
                    np.admin = p.admin
                    np.cuotaPartido=p.cuotaPartido
                    np.tipoResPartido=p.tipoResPartido
                    np.finalizado = p.finalizado
                    np.finalLocal = p.finalLocal
                    np.finalVisitante = p.finalVisitante
                    
                    for c in cuotas
                    {
                        if c.pronostico == p.resultadoPartido
                        {
                            np.cuota = c.cuota
                            break;
                        }
                    }
                    
                    
                    np.balance = p.resultadoPartido
                    if (np.balance == "1X")
                    {
                        if finalLocal >= finalVisitante && finalizado
                        {
                            np.acertado = "1"
                        }
                        else
                        {
                            np.acertado = "0"
                        }
                    }
                    else if (np.balance == "X2")
                    {
                        if finalLocal <= finalVisitante && finalizado
                        {
                            np.acertado = "1"
                        }
                        else
                        {
                            np.acertado = "0"
                        }
                    }
                    else
                    {
                        if (finalLocal < finalVisitante || finalLocal > finalVisitante) && finalizado
                        {
                            np.acertado = "1"
                        }
                        else
                        {
                            np.acertado = "0"
                        }
                    }
                    //   if np.cuota != nil && np.cuota != ""
                    // {
                    eventos.append(np)
                    // }
                    
                }
                
            }
        }
        
        
        
        
        eventos.sort(by: sortEventos)
        
        
        
    }
    
    func sortEventos(this:EstructuraEquiposPartido, that:EstructuraEquiposPartido) -> Bool {
        
        
        var ti = 0.00
        if (this.cuota != nil && this.cuota! != "")
        {
             ti = this.cuota!.toDouble()!
        }
        
        var ta = 0.00
        if (that.cuota != nil && that.cuota! != "")
        {
             ta = that.cuota!.toDouble()!
        }
        
        
            return ti > ta
    }
    
    
    
    func  validarCuota ( cuota : String) -> Bool
    {
        var cuotaValida = false
        
        if cuota != ""
        {
            let valorCuota = cuota.toDouble()!
            if valorCuota >= 1.3
            {
                cuotaValida = true
            }
        }
        
        return cuotaValida
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
