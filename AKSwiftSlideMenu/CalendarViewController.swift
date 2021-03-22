//
//  CalendarViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/24/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit

class CalendarViewController : BaseViewController
{
    
    let dispatchGroup = DispatchGroup()
    
    @IBAction func btnSelFecha(_ sender: UIButton) {
        activarAI()
       
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        fechaActual = formatter.string(from: dpCalendario.date)
        
         dispatchGroup.enter()
        obtenerDatosAsync()
        dispatchGroup.notify(queue: .main)
        {
            self.detenerAI()
             self.performSegue(withIdentifier: "irPaises", sender: "self")
        }
        
    }
    @IBOutlet weak var dpCalendario: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSlideMenuButton()
        
    }
    
    var ai : UIActivityIndicatorView = UIActivityIndicatorView()
    
    func activarAI()
    {
        ai.center = self.view.center
        ai.hidesWhenStopped = true
        ai.style = UIActivityIndicatorView.Style.gray
        view.addSubview(ai)
        ai.startAnimating()
    }
    
    func detenerAI()
    {
        ai.stopAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func obtenerDatosAsync()
    {
        
        DispatchQueue.main.async {
            
            
            
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
                               
                              
                               todos = try  JSONDecoder().decode(RespuestaPartidos.self,from: data ).datos
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
                               
                               DispatchQueue.main.async {
                                   self.dispatchGroup.leave()
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
    }
}
