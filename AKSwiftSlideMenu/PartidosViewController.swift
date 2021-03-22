

import UIKit

class PartidosViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var imageDownloadedLocal = UIImage()
    var imageDownloadedVisitante = UIImage()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return partidos.count
    }
    
    
    var dispatchGroupLocal = DispatchGroup()
    var dispatchGroupVisitante = DispatchGroup()
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let ut = Utils()
        let cell = Bundle.main.loadNibNamed("PartidosTableViewCell", owner: self, options: nil)?.first as! PartidosTableViewCell
        
        cell.lblLocal.text=partidos[indexPath.row].equipoLocal
        cell.lblVisitante.text=partidos[indexPath.row].equipoVisitante
        
        
        if indexPath.row % 2 == 0
        {
            cell.backgroundColor = ut.colorUIHex(hex: "F6F3F0")
            cell.viewVS.backgroundColor=ut.colorUIHex(hex: "F6F3F0")
            cell.viewHora.backgroundColor=ut.colorUIHex(hex: "F6F3F0")
            cell.viewLocal.backgroundColor=ut.colorUIHex(hex: "F6F3F0")
            cell.viewVisitante.backgroundColor=ut.colorUIHex(hex: "F6F3F0")
        }
        else
        {
            cell.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
        }
        if partidos[indexPath.row].logoLocal != nil
        {
            let urls = URL(string:partidos[indexPath.row].logoLocal! )
            if let data = try? Data(contentsOf: urls!) {
                if let image = UIImage(data: data) {
                    cell.logoLocal.image=image
                }
            }
        }
        if partidos[indexPath.row].logoVisitante != nil
        {
            let urls = URL(string:partidos[indexPath.row].logoVisitante! )
            if let data = try? Data(contentsOf: urls!) {
                if let image = UIImage(data: data) {
                    cell.logoVisitante.image=image
                }
            }
        }
        let seconds = TimeZone.current.secondsFromGMT()
        
        var hora = partidos[indexPath.row].hora!
        
        hora = hora.replacingOccurrences(of: "1970-01-01", with: fechaActual)
        
        hora = hora.replacingOccurrences(of: ":00.0", with: "")
        
        

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let fechaPartido = dateFormatter.date(from:hora)!
         let hours = seconds/3600
        var dateComponent = DateComponents()
        
        dateComponent.hour = hours
        
        
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: fechaPartido)
        
        let dateFormatterH = DateFormatter()
        dateFormatterH.dateFormat = "HH:mm"
        

       
        
        cell.lblHora.text=dateFormatterH.string(from: futureDate!)
        
        
        return cell
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addSlideMenuButton()
        addCalendarButton(fecha: dia)
        armarPartidos()
        
        // Do any additional setup after loading the view.
    }
    
    
    func armarPartidos()
    {
        partidos = [EstructuraEquiposPartido]()
        
        let idLiga = ligas[indexLigaSelected].idLiga
        
        if todos.count > 0
        {
            for p in todos
            {
                if p.idLiga != nil
                {
                    if p.idLiga == idLiga
                    {
                        partidos.append(p)
                    }
                }
            }
        }
        
        
        
        
        
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPartidoSelected=indexPath.row
        
        
        let idPartido =  partidos[indexPartidoSelected].idPartido!.toInt()
                     let ser = ConsultasServiceImplService()
                     let idUsuario = UserDefaults.standard.string(forKey: "idUsuario")
                     let token = UserDefaults.standard.string(forKey: "token")
                     let res = ser.obtenerDatosPartidoI(idPartido: idPartido!, idUsuario: idUsuario!, token: token!)
                     //let newString = res.replacingOccurrences(of: "#", with: "\"")
                      let stringres = res.replacingOccurrences(of: "#", with: "\"", options: .literal, range: nil)
                     do
                     {
                        datosPartido = try  JSONDecoder().decode(EstructuraDatosPartido.self,from:stringres.data(using: String.Encoding.utf8)!)
                     
                     }
                     catch
                     {
                         
                     }
        
        
        
        performSegue(withIdentifier: "irPartidoTab", sender: "self")
    }
    
}
