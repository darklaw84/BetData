

import UIKit


var balances = [EstructuraEquiposPartido]()
class BalancesViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return balances.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexBalanceSelected=indexPath.row
        indexApuestaLocaSelected = -1
        indexEventosSelected = -1
        performSegue(withIdentifier: "irVistaPartido", sender: "self")
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let ut = Utils()
        let cell = Bundle.main.loadNibNamed("BalancesTVCTableViewCell", owner: self, options: nil)?.first as! BalancesTVCTableViewCell
        
        cell.txtLiga.text=balances[indexPath.row].liga
        var equipoLocal = ""
        if balances[indexPath.row].equipoLocal == nil
        {
            equipoLocal = ""
        }
        else
        {
            equipoLocal = balances[indexPath.row].equipoLocal!
        }
        var equipoVisitante = ""
        if balances[indexPath.row].equipoVisitante == nil
        {
            equipoVisitante = ""
        }
        else
        {
            equipoVisitante = balances[indexPath.row].equipoVisitante!
        }
        cell.txtPartido.text = equipoLocal + " - " + equipoVisitante
        cell.imgBandera.image = UIImage(named: balances[indexPath.row].pais!+".png")
        cell.txtBalance.text = balances[indexPath.row].balance
        
        if balances[indexPath.row].cuotaPartido != nil
        {
            cell.txtCuota.text = balances[indexPath.row].cuotaPartido
        }
        else
        {
            if balances[indexPath.row].cuota != nil
            {
                cell.txtCuota.text = balances[indexPath.row].cuota
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
        
        let admin = balances[indexPath.row].admin
        let tipoRes = balances[indexPath.row].tipoResPartido
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
        
        let acertado = balances[indexPath.row].acertado
        
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
        armarBalances()
        
        // Do any additional setup after loading the view.
    }
    
    func armarBalances()
    {
        balances = [EstructuraEquiposPartido]()
        
       var completos = [EstructuraEquiposPartido]()
        completos.append(contentsOf: todos)
        
        completos.append(contentsOf: menos35)
        
      
        
        var rp1 = [EstructuraEquiposPartido]()
        var rp2 = [EstructuraEquiposPartido]()
        let rp3 = [EstructuraEquiposPartido]()
        var rp4 = [EstructuraEquiposPartido]()
        var rp5 = [EstructuraEquiposPartido]()
        var rp6 = [EstructuraEquiposPartido]()
        let rp7 = [EstructuraEquiposPartido]()
        var rp8 = [EstructuraEquiposPartido]()
        var rp9 = [EstructuraEquiposPartido]()
        let rp10 = [EstructuraEquiposPartido]()
        var rp11 = [EstructuraEquiposPartido]()
        var rp12 = [EstructuraEquiposPartido]()
        var rp13 = [EstructuraEquiposPartido]()
        var rp14 = [EstructuraEquiposPartido]()
        var rp15 = [EstructuraEquiposPartido]()
        var rp16 = [EstructuraEquiposPartido]()
        var cornersPositivo = [EstructuraEquiposPartido]()
        var cornersNegativo = [EstructuraEquiposPartido]()
        var tarjetasPositivo = [EstructuraEquiposPartido]()
        var tarjetasNegativo = [EstructuraEquiposPartido]()
        var conCuota = [EstructuraEquiposPartido]()
        var golesPositivo = [EstructuraEquiposPartido]()
        
        
        if completos.count > 0
        {
            for p in completos
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
                    
                    if p.cuotaPartido != nil
                    {
                        if p.resultadoPartido == "G"
                        {
                            if p.idEquipoFavorito == p.idEquipoLocal
                            {
                                np.balance = p.equipoLocal
                                np.localvisitante = "L"
                                if finalLocal > finalVisitante && finalizado
                                {
                                    np.acertado="1"
                                }
                                else
                                {
                                    np.acertado="0"
                                }
                            }
                            else
                            {
                                np.balance=p.equipoVisitante
                                np.localvisitante = "V"
                                if finalLocal < finalVisitante && finalizado
                                {
                                    np.acertado = "1"
                                }
                                else
                                {
                                    np.acertado = "0"
                                }
                            }
                        }
                        else if p.resultadoPartido == "1S" || p.resultadoPartido == "2S"
                        {
                            if p.idEquipoFavorito == p.idEquipoLocal
                            {
                                np.balance = p.equipoLocal! + " sin X"
                                np.localvisitante = "L"
                                
                                if finalLocal > finalVisitante && finalizado
                                {
                                    np.acertado = "1"
                                }
                                else if finalLocal == finalVisitante && finalizado
                                {
                                    np.acertado = "N"
                                }
                                else
                                {
                                    np.acertado = "0"
                                }
                            }
                            else
                            {
                                np.balance = p.equipoVisitante! + " sin X"
                                np.localvisitante = "V"
                                if finalLocal < finalVisitante && finalizado
                                {
                                    np.acertado = "1"
                                }
                                else if finalLocal == finalVisitante && finalizado
                                {
                                    np.acertado = "N"
                                }
                                else
                                {
                                    np.acertado = "0"
                                }
                            }
                        }
                        else
                        {
                            np.balance = p.resultadoPartido
                            if p.resultadoPartido == "1X"
                            {
                                np.localvisitante = "L"
                                if finalLocal >= finalVisitante && finalizado
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
                                np.localvisitante = "V"
                                if finalLocal <= finalVisitante && finalizado
                                {
                                    np.acertado = "1"
                                }
                                else
                                {
                                    np.acertado = "0"
                                }
                                
                            }
                        }
                        
                        if np.balance != nil && np.balance != "0"
                        {
                            if np.tipoResPartido != nil
                            {
                                if np.tipoResPartido == "1"
                                {
                                    if np.localvisitante == "V"
                                    {
                                        rp1.append(np)
                                    }
                                    else
                                    {
                                        np.balance = "X2"
                                        rp1.append(np)
                                        if finalLocal <= finalVisitante && finalizado
                                        {
                                            np.acertado = "1"
                                        }
                                        else
                                        {
                                            np.acertado = "0"
                                        }
                                    }
                                }
                                else if np.tipoResPartido == "2"
                                {
                                    rp2.append(np)
                                }
                                else if np.tipoResPartido == "3"
                                {
                                    
                                }
                                else if np.tipoResPartido == "4"
                                {
                                    rp4.append(np)
                                }
                                else if np.tipoResPartido == "5"
                                {
                                    if np.localvisitante == "L"
                                    {
                                        rp5.append(np)
                                    }
                                }
                                else if np.tipoResPartido == "6"
                                {
                                    if np.localvisitante == "V"
                                    {
                                        np.balance = "1X"
                                        if finalLocal >= finalVisitante && finalizado
                                        {
                                            np.acertado = "1"
                                        }
                                        else
                                        {
                                            np.acertado = "0"
                                        }
                                        rp6.append(np)
                                    }
                                    else
                                    {
                                        let mediaGolHiLocalFinal = p.mediaGolhiLocalFinal?.toDouble()
                                        let mediaGolvisitantecomoVisitante = p.mediaGolVisitanteComoVisitante?.toDouble()
                                        if(mediaGolHiLocalFinal != nil)
                                        {
                                            if mediaGolHiLocalFinal! > 1 && mediaGolHiLocalFinal! < 3
                                            {
                                                if p.cumplioMediaGolVisitante == "NO"
                                                {
                                                    if p.cumplioMediaGolLocal == "SI"
                                                    {
                                                        if mediaGolvisitantecomoVisitante! < 1
                                                        {
                                                            rp6.append(np)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    
                                }
                                else if np.tipoResPartido == "7"
                                {
                                    
                                }
                                else if np.tipoResPartido == "8"
                                {
                                    rp8.append(np)
                                }
                                else if np.tipoResPartido == "9"
                                {
                                    if np.localvisitante == "L"
                                    {
                                        rp9.append(np)
                                    }
                                }
                                else if np.tipoResPartido == "10"
                                {
                                    
                                }
                                else if np.tipoResPartido == "11"
                                {
                                    if np.localvisitante == "L"
                                    {
                                        rp11.append(np)
                                    }
                                }
                                else if np.tipoResPartido == "12"
                                {
                                    if np.localvisitante == "V"
                                    {
                                        np.balance = "1X"
                                        if finalLocal >= finalVisitante && finalizado
                                        {
                                            np.acertado = "1"
                                        }
                                        else
                                        {
                                            np.acertado = "0"
                                        }
                                        rp12.append(np)
                                    }
                                }
                            }//nil
                        }//balance
                    }//cuota
                    else
                    {
                        if np.tipoResPartido == "13"
                        {
                            np.cuota = ""
                            for c in cuotas
                            {
                                if c.pronostico == p.resultadoPartido
                                {
                                    np.cuota = c.cuota
                                    break
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
                            else
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
                            if np.cuota != ""
                            {
                                rp13.append(np)
                            }
                        }
                        
                        
                        
                        if np.tipoResPartido == "14"
                        {
                            np.cuota = ""
                            for c in cuotas
                            {
                                if c.pronostico == p.resultadoPartido
                                {
                                    np.cuota = c.cuota
                                    break
                                }
                            }
                            np.balance = p.resultadoPartido
                            if (np.balance == "+1.5")
                            {
                                if finalLocal + finalVisitante>1 && finalizado
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
                                
                                if finalLocal + finalVisitante<2 && finalizado
                                {
                                    np.acertado = "1"
                                }
                                else
                                {
                                    np.acertado = "0"
                                }
                            }
                            if np.cuota != ""
                            {
                                rp14.append(np)
                            }
                        }
                        
                        if np.tipoResPartido == "15"
                        {
                            
                            
                            np.balance = p.resultadoPartido
                            if (np.balance == "ME")
                            {
                                np.balance = "-3.5"
                                for c in cuotas
                                {
                                    if c.pronostico == np.balance
                                    {
                                        np.cuota = c.cuota
                                        break
                                    }
                                }
                                if finalLocal + finalVisitante<41 && finalizado
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
                                np.balance = "+3.5"
                                for c in cuotas
                                {
                                    if c.pronostico == np.balance
                                    {
                                        np.cuota = c.cuota
                                        break
                                    }
                                }
                                if finalLocal + finalVisitante >= 4 && finalizado
                                {
                                    np.acertado = "1"
                                }
                                else
                                {
                                    np.acertado = "0"
                                }
                            }
                            if np.cuota != ""
                            {
                                rp15.append(np)
                            }
                        }
                        
                        
                        
                        if np.tipoResPartido == "16"
                                               {
                                                   np.cuota = ""
                                                   for c in cuotas
                                                   {
                                                       if c.pronostico == p.resultadoPartido
                                                       {
                                                           np.cuota = c.cuota
                                                           break
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
                                                else if (np.balance == "12")
                                                {
                                                    if ((finalLocal < finalVisitante) || (finalLocal > finalVisitante)) && finalizado
                                                    {
                                                        np.acertado = "1"
                                                    }
                                                    else
                                                    {
                                                        np.acertado = "0"
                                                    }
                                                }
                                                   if np.cuota != ""
                                                   {
                                                       rp16.append(np)
                                                   }
                                               }
                                               
                                               
                                               
                        
                        
                        
                        
                    }
                    
                    
                }//respartido
                
                if p.cornesNegativo != nil && p.cornesNegativo!.toInt()! > 0
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
                    np.balance = "Corner: + " + p.cornesNegativo!
                    cornersNegativo.append(np)
                }
                
                
                if p.cornersPositivo != nil && p.cornersPositivo!.toInt()! > 0
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
                    np.balance = "Corner: + " + p.cornersPositivo!
                    cornersPositivo.append(np)
                }
                
              /*  if p.tarjetasNegativo != nil && p.tarjetasNegativo!.toFloat()! > 0
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
                    np.balance = "Tarjeta: - " + p.tarjetasNegativo!
                    if p.tarjetasNegativo == "2.5"
                    {
                        tarjetasNegativo.append(np)
                    }
                }*/
                
                if p.tarjetasPositivo != nil && p.tarjetasPositivo!.toFloat()! > 0
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
                    np.balance = "Tarjeta: + " + p.tarjetasPositivo!
                    if p.tarjetasPositivo == "3.5" || p.tarjetasPositivo == "4.5" || p.tarjetasPositivo == "5.5"
                    {
                        tarjetasPositivo.append(np)
                    }
                }
                
                
                
                if p.golesPositivo != nil && p.golesPositivo!.toFloat()! > 0
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
                    np.balance = "Gol: + " + p.golesPositivo!
                    for c in cuotas
                    {
                        if c.pronostico == "+"+p.golesPositivo! || c.pronostico == "+" + p.golesPositivo!+".5"
                        {
                            np.cuota = c.cuota
                        }
                    }
                    if p.golesPositivo != nil && p.golesPositivo != "2.5"
                    {
                        if validarCuota(cuota: np.cuota!)
                        {
                            if p.golesPositivo! == "1.5"
                            {
                                if finalLocal + finalVisitante > 1
                                {
                                    np.acertado="1"
                                }
                            }
                            conCuota.append(np)
                        }
                        else
                        {
                            golesPositivo.append(np)
                        }
                    }
                
                }
             
            }
        }
        
        balances.append(contentsOf: rp13)
        balances.append(contentsOf: rp14)
        balances.append(contentsOf: rp15)
        balances.append(contentsOf: rp16)
        balances.append(contentsOf: rp5)
        balances.append(contentsOf: rp9)
        balances.append(contentsOf: rp11)
        balances.append(contentsOf: rp6)
        balances.append(contentsOf: rp10)
        balances.append(contentsOf: rp12)
        balances.append(contentsOf: rp1)
        balances.append(contentsOf: rp2)
        balances.append(contentsOf: rp3)
        balances.append(contentsOf: rp4)
        balances.append(contentsOf: rp7)
        balances.append(contentsOf: rp8)
        balances.append(contentsOf: conCuota)
        balances.append(contentsOf: tarjetasNegativo)
        balances.append(contentsOf: tarjetasPositivo)
        balances.append(contentsOf: cornersNegativo)
        balances.append(contentsOf: cornersPositivo)
        
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
