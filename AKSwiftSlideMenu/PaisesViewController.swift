

import UIKit



var todos = [EstructuraEquiposPartido]()
var normal = [EstructuraEquiposPartido]()
var ganan = [EstructuraEquiposPartido]()
var mas15 = [EstructuraEquiposPartido]()
var menos35 = [EstructuraEquiposPartido]()
var doble1X = [EstructuraEquiposPartido]()
var doble12 = [EstructuraEquiposPartido]()
var dobleX2 = [EstructuraEquiposPartido]()



var paises = [EstructuraEquiposPartido]()
var partidos = [EstructuraEquiposPartido]()
var fechaActual = ""
var dia = ""
var calendar = ""
var indexSelected = 0
var indexLigaSelected = 0
var indexBalanceSelected = 0
var indexApuestaLocaSelected = 0
var indexEventosSelected = 0
var indexPartidoSelected = 0
var datosPartido = EstructuraDatosPartido()




class PaisesViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tablaPaises: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return paises.count
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let ut = Utils()
        let cell=tableView.dequeueReusableCell(withIdentifier: "cellPais", for: indexPath) as!TablaPaisesViewController
        if paises[indexPath.row].pais != nil
        {
            cell.lblPais?.text=paises[indexPath.row].pais
            cell.imgBandera.image = UIImage(named: paises[indexPath.row].pais!+".png")
        }
        if indexPath.row % 2 == 0
        {
            cell.backgroundColor = ut.colorUIHex(hex: "F6F3F0")
        }
        else
        {
            cell.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        actualizarDatosPaquete()
        
        if estaVigente()
        {
            
            
            
            
            
            
            addSlideMenuButton()
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            if fechaActual==""
            {
                fechaActual = formatter.string(from: date)
            }
            
            dia=String(fechaActual.suffix(2))
            addCalendarButton(fecha: dia )
            
            if todos.count == 0
            {
                obtenerDatos()
            }
        }
        else
        {
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "SuscripcionViewController"))!
            vc.modalPresentationStyle = .fullScreen
            self.show(vc, sender: nil)
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    func actualizarDatosPaquete()
    {
        let ser = ConsultasServiceImplService()
        let idUsuario = UserDefaults.standard.string(forKey: "idUsuario")
        let usuario = UserDefaults.standard.string(forKey: "usuario")
        let token = UserDefaults.standard.string(forKey: "token")
        let res1 = ser.consultarDatosUsuario(usuario: usuario!, idUsuario: idUsuario!, token: token!)
        let newString = res1.replacingOccurrences(of: "'", with: "\"")
        do{
            let  res2 = try  JSONDecoder().decode(EstructuraLogin.self,from:newString.data(using: String.Encoding.utf8)!)
            
            if res2.paquete == nil
                
            {            UserDefaults.standard.set("Sin suscripcion", forKey:"paquete")
            }
            else
            {
                UserDefaults.standard.set(res2.paquete, forKey:"paquete")
            }
            UserDefaults.standard.set(res2.fechaPaquete, forKey:"fechaPaquete")
        }
        catch
        {
            
        }
        
    }
    
    func estaVigente()->Bool
    {
        
        let fechaPaquete = UserDefaults.standard.string(forKey: "fechaPaquete")
        if fechaPaquete == nil
        {
            return false
        }
        else
        {
            let dateFormatterH = DateFormatter()
            dateFormatterH.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let fechaPaqueteD=dateFormatterH.date(from: fechaPaquete!)
            if fechaPaqueteD! < Date()
            {
                return false
            }
            else
            {
                return true
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelected=indexPath.row
        performSegue(withIdentifier: "irALigas", sender: "self")
    }
    
    func obtenerDatos()
    {
        
         todos = [EstructuraEquiposPartido]()
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if fechaActual==""
        {
            fechaActual = formatter.string(from: date)
        }
        let idUsuario = UserDefaults.standard.string(forKey: "idUsuario")
        let token = UserDefaults.standard.string(forKey: "token")
        
        
        
        let ut : Utils = Utils()
        
        let Url = String(ut.obtenerUrlServicios() + "obtenerPartidosPorDia.php")
        let serviceUrl = URL(string: Url)!
        let parameters: [String: Any] = [
            "fecha" : fechaActual,
            "token": token!,
            "idUsuario": idUsuario!
        ]
        
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.httpBody = httpBody
        request.timeoutInterval = 20
        let session = URLSession.shared
        
        
        session.dataTask(with: request) { (data, response, error) in
            
            if let data = data {
                do {
                    normal = try  JSONDecoder().decode(RespuestaPartidos.self,from: data ).datos
                    todos.append(contentsOf: normal)
                    DispatchQueue.main.async {
                        self.acomodarDatos()
                        self.actualizarTabla()
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
        
        
        
        let gananUrl = String(ut.obtenerUrlServicios() + "obtenerPartidosGanan.php")
        let gananserviceUrl = URL(string: gananUrl)!
        let gananparameters: [String: Any] = [
            "fecha" : fechaActual,
            "token": token!,
            "idUsuario": idUsuario!
        ]
        
        var gananrequest = URLRequest(url: gananserviceUrl)
        gananrequest.httpMethod = "POST"
        gananrequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let gananhttpBody = try? JSONSerialization.data(withJSONObject: gananparameters, options: [])
        gananrequest.httpBody = gananhttpBody
        gananrequest.timeoutInterval = 20
        let ganansession = URLSession.shared
        
        
        ganansession.dataTask(with: gananrequest) { (data, response, error) in
            
            if let data = data {
                do {
                    ganan = try  JSONDecoder().decode(RespuestaPartidos.self,from: data ).datos
                    
                    
                } catch {
                    print(error)
                }
            }
        }.resume()
        
        

        let mas15Url = String(ut.obtenerUrlServicios() + "obtenerPartidosMas15.php")
                   let mas15serviceUrl = URL(string: mas15Url)!
                   let mas15parameters: [String: Any] = [
                       "fecha" : fechaActual,
                       "token": token!,
                       "idUsuario": idUsuario!
                   ]
                   
                   var mas15request = URLRequest(url: mas15serviceUrl)
                          mas15request.httpMethod = "POST"
                          mas15request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
                          let mas15httpBody = try? JSONSerialization.data(withJSONObject: mas15parameters, options: [])
                          mas15request.httpBody = mas15httpBody
                          mas15request.timeoutInterval = 20
                          let mas15session = URLSession.shared
                          
                          
                          mas15session.dataTask(with: mas15request) { (data, response, error) in
                              
                              if let data = data {
                                  do {
                                      mas15 = try  JSONDecoder().decode(RespuestaPartidos.self,from: data ).datos
                                      
                                      
                                  } catch {
                                      print(error)
                                  }
                              }
                          }.resume()
                   

        
      
        
        let menos35Url = String(ut.obtenerUrlServicios() + "obtenerPartidosMenos35.php")
        let menos35serviceUrl = URL(string: menos35Url)!
        let menos35parameters: [String: Any] = [
            "fecha" : fechaActual,
            "token": token!,
            "idUsuario": idUsuario!
        ]
        
        var menos35request = URLRequest(url: menos35serviceUrl)
        menos35request.httpMethod = "POST"
        menos35request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let menos35httpBody = try? JSONSerialization.data(withJSONObject: menos35parameters, options: [])
        menos35request.httpBody = menos35httpBody
        menos35request.timeoutInterval = 20
        let menos35session = URLSession.shared
        
        
        menos35session.dataTask(with: menos35request) { (data, response, error) in
            
            if let data = data {
                do {
                    menos35 = try  JSONDecoder().decode(RespuestaPartidos.self,from: data ).datos
                    
                    
                } catch {
                    print(error)
                }
            }
        }.resume()
        
        
        
        
        
        let doble1XUrl = String(ut.obtenerUrlServicios() + "obtenerPartidosPorDia1X.php")
        let doble1XserviceUrl = URL(string: doble1XUrl)!
        let doble1Xparameters: [String: Any] = [
            "fecha" : fechaActual,
            "token": token!,
            "idUsuario": idUsuario!
        ]
        
        var doble1Xrequest = URLRequest(url: doble1XserviceUrl)
        doble1Xrequest.httpMethod = "POST"
        doble1Xrequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let doble1XhttpBody = try? JSONSerialization.data(withJSONObject: doble1Xparameters, options: [])
        doble1Xrequest.httpBody = doble1XhttpBody
        doble1Xrequest.timeoutInterval = 20
        let doble1Xsession = URLSession.shared
        
        
        doble1Xsession.dataTask(with: doble1Xrequest) { (data, response, error) in
            
            if let data = data {
                do {
                    doble1X = try  JSONDecoder().decode(RespuestaPartidos.self,from: data ).datos
                    
                    
                } catch {
                    print(error)
                }
            }
        }.resume()
        
        
        
        
        
        let doble12Url = String(ut.obtenerUrlServicios() + "obtenerPartidosPorDia12.php")
        let doble12serviceUrl = URL(string: doble12Url)!
        let doble12parameters: [String: Any] = [
            "fecha" : fechaActual,
            "token": token!,
            "idUsuario": idUsuario!
        ]
        
        var doble12request = URLRequest(url: doble12serviceUrl)
        doble12request.httpMethod = "POST"
        doble12request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let doble12httpBody = try? JSONSerialization.data(withJSONObject: doble12parameters, options: [])
        doble12request.httpBody = doble12httpBody
        doble12request.timeoutInterval = 20
        let doble12session = URLSession.shared
        
        
        doble12session.dataTask(with: doble12request) { (data, response, error) in
            
            if let data = data {
                do {
                    doble12 = try  JSONDecoder().decode(RespuestaPartidos.self,from: data ).datos
                    
                    
                } catch {
                    print(error)
                }
            }
        }.resume()
        
        
        
        
        let dobleX2Url = String(ut.obtenerUrlServicios() + "obtenerPartidosPorDiaX2.php")
        let dobleX2serviceUrl = URL(string: dobleX2Url)!
        let dobleX2parameters: [String: Any] = [
            "fecha" : fechaActual,
            "token": token!,
            "idUsuario": idUsuario!
        ]
        
        var dobleX2request = URLRequest(url: dobleX2serviceUrl)
        dobleX2request.httpMethod = "POST"
        dobleX2request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let dobleX2httpBody = try? JSONSerialization.data(withJSONObject: dobleX2parameters, options: [])
        dobleX2request.httpBody = dobleX2httpBody
        dobleX2request.timeoutInterval = 20
        let dobleX2session = URLSession.shared
        
        
        dobleX2session.dataTask(with: dobleX2request) { (data, response, error) in
            
            if let data = data {
                do {
                    dobleX2 = try  JSONDecoder().decode(RespuestaPartidos.self,from: data ).datos
                    
                    
                } catch {
                    print(error)
                }
            }
        }.resume()
        
        
    }
    
    
    
    
    
    func acomodarDatos()
    {
        if todos.count > 0
        {
            for p in todos
            {
                if paises.count > 0
                {
                    var encontrado = false
                    for l in paises
                    {
                        if l.pais != nil
                        {
                            if l.pais == p.pais
                            {
                                encontrado = true
                            }
                        }
                    }
                    if !encontrado
                    {
                        paises.append(p)
                    }
                }
                else{
                    paises.append(p)
                }
            }
        }
    }
    
    
    func actualizarTabla()
    {
        tablaPaises.reloadData()
    }
    
    
    
}





