//
//  SuscripcionviewController.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 10/20/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit
import StoreKit

class SuscripcionViewController : UIViewController, SKProductsRequestDelegate,SKPaymentTransactionObserver {
    
    
    
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var lblPaquete: UILabel!
    @IBOutlet weak var btnSuscripcion: UIButton!
    @IBOutlet weak var txtPrecio: UILabel!
    
    var productID = "mens0ami"
    var myProducto = SKProduct()
    var verifyURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        obtenerInfoProducto()
        lblPaquete.text = UserDefaults.standard.string(forKey: "paquete")
        lblFecha.text = UserDefaults.standard.string(forKey: "fechaPaquete")
        
    }
    
    
    func obtenerInfoProducto()
    {
        if SKPaymentQueue.canMakePayments() {
          
            let request = SKProductsRequest(productIdentifiers: NSSet(objects: self.productID) as Set<NSObject> as Set<NSObject> as! Set<String>)
                       request.delegate = self
                       request.start()
        } else {
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "Please enable In App Purchase in Settings."
            alert.addButton(withTitle: "Ok")
            alert.show()
        }
        
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print(response.invalidProductIdentifiers)
        print(response.description)
        print(response.debugDescription)
        if let product = response.products.first {
            myProducto = product
            print (product.price)
            print(product.localizedDescription)
            print(product.localizedTitle)
            print (product.productIdentifier)
            
            DispatchQueue.main.async {
                self.txtPrecio.text = self.priceStringForProduct(item: product)
                   
               }
            
        }
    }
    
    func priceStringForProduct(item: SKProduct) -> String? {
        let price = item.price
        if price == NSDecimalNumber(decimal: 0.00) {
            return "GET" //or whatever you like really... maybe 'Free'
        } else {
            let numberFormatter = NumberFormatter()
            let locale = item.priceLocale
            numberFormatter.numberStyle = .currency
            numberFormatter.locale = locale
            return numberFormatter.string(from: price)
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions
        {
            switch transaction.transactionState
            {
                
            case .purchasing:
                print("comprando")
               // SKPaymentQueue.default().finishTransaction(transaction)
               // SKPaymentQueue.default().remove(self)
                break
            case .purchased, .restored:
                print("comprada")
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                loadReceipt()
                break
            case .failed:
                print("fallo")
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                break
                
            case .deferred:
                print("no lo logro")
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                break
            }
        }
    }
    
    
    private func loadReceipt() {
      // Load the receipt into a Data object
      let receiptURL = Bundle.main.appStoreReceiptURL
        
        do
        {
        let   receiptString = try Data(contentsOf: receiptURL!).base64EncodedString()
            
             let ser = ConsultasServiceImplService()
            let idUsuario = UserDefaults.standard.string(forKey: "idUsuario")
            let usuario = UserDefaults.standard.string(forKey: "usuario")
                          let token = UserDefaults.standard.string(forKey: "token")
            let password = UserDefaults.standard.string(forKey: "password")
            
            ser.pagoRealizadoIOS(idUsuario: idUsuario!, token: token!, certificadoIOS: receiptString)
            let ut : Utils = Utils()
            let serial = ut.obtenerSerial()
            
            let res2 = ser.loginUsuarioI(usuario:usuario!, password:password!, serial: serial)
                       let stringres = res2.replacingOccurrences(of: "#", with: "\"", options: .literal, range: nil)
                       do
                       {
                           
                         let  res = try  JSONDecoder().decode(EstructuraLogin.self,from:stringres.data(using: String.Encoding.utf8)!)
                           
                         
                           
                           
                           if res.error=="OK"
                           {
                               
                               //aqui subimos a sesion todo
                               
                               UserDefaults.standard.set(res.idUsuario, forKey:"idUsuario");
                               UserDefaults.standard.set(password, forKey:"password");
                               UserDefaults.standard.set(res.usuario, forKey:"usuario");
                               UserDefaults.standard.set(res.codigoAmistad, forKey:"codigoAmistad");
                               
                               UserDefaults.standard.set(res.correo, forKey:"correoUsuario");
                               UserDefaults.standard.set(res.token, forKey:"token");
                               UserDefaults.standard.set(res.amigosbuenPedo, forKey:"amigosBuenPedo");
                               UserDefaults.standard.set(res.fechaPaquete, forKey:"fechaPaquete");
                               if res.paquete == nil
                               {
                                   UserDefaults.standard.set("Sin suscripción", forKey:"paquete");
                               }
                               else
                               {
                                   let nombrePaquete = "paquete: " + res.paquete!
                                   UserDefaults.standard.set(nombrePaquete, forKey:"paquete");
                               }
                               
                               UserDefaults.standard.synchronize();
                            
                               
                                   
                                   let vc = (self.storyboard?.instantiateViewController(withIdentifier: "homeNav"))!
                                                             vc.modalPresentationStyle = .fullScreen
                                                                    self.show(vc, sender: nil)
                               
                           }
                           
                           
                       }
                       catch
                       {
                           print("Error info: \(error)")
                            print("JSON: \(res2)")
                            print("Error info: \(error)")
                       }
            
        }
        catch
        {
            
        }
       
    }
    
    
    @IBAction func btnRegresar(_ sender: Any) {
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "homeNav"))!
        vc.modalPresentationStyle = .fullScreen
        self.show(vc, sender: nil)
        
    }
    
    
    @IBAction func btnSuscripcion(_ sender: Any) {
        let myProduct = myProducto
        
        
        if SKPaymentQueue.canMakePayments()
        {
            let payment = SKPayment(product: myProduct)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
            
        }
        
    }
    
    @IBAction func btnCerrarSesion(_ sender: Any) {
        
        cerrarSesion()
    }
    
    func cerrarSesion()
    {
        let ser = ConsultasServiceImplService()
               let idUsuario = UserDefaults.standard.string(forKey: "idUsuario")
               let token = UserDefaults.standard.string(forKey: "token")
                 ser.cerrarSesion( idUsuario: idUsuario!, token: token!)
               
              
                   
                   UserDefaults.standard.set("", forKey:"idUsuario");
                   UserDefaults.standard.set("", forKey:"usuario");
                   UserDefaults.standard.synchronize();
                    let vc = (self.storyboard?.instantiateViewController(withIdentifier: "loginViewController"))!
                                  vc.modalPresentationStyle = .fullScreen
             
                                         self.show(vc, sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
}
