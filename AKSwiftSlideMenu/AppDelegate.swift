//
//  AppDelegate.swift
//  AKSwiftSlideMenu
//
//  Created by Ashish on 21/09/15.
//  Copyright (c) 2015 Kode. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        
        validarSesion()
       
        
        return true
    }
    
    func validarSesion()
    {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let susVC = mainStoryboard.instantiateViewController(withIdentifier: "SuscripcionViewController") as! SuscripcionViewController
        let logVC = mainStoryboard.instantiateViewController(withIdentifier: "loginViewController") as! LoginViewController
        
        let home = mainStoryboard.instantiateViewController(withIdentifier: "homeNav") as! UINavigationController
        
        
        let idUsuario = UserDefaults.standard.string(forKey: "idUsuario")
        
        if idUsuario != nil && idUsuario != ""
        {
            //quiere decir que ya se había logueado
            // por lo tanto revisamos su vigencia para saber a que
            //pantalla lo mandamos
            
            if estaVigente()
            {
               appDelegate.window?.rootViewController = home
                                    appDelegate.window?.makeKeyAndVisible()
            }
            else
            {
               appDelegate.window?.rootViewController = susVC
                      appDelegate.window?.makeKeyAndVisible()
                      
            }
            
        }
        else
        {
            appDelegate.window?.rootViewController = logVC
                                                appDelegate.window?.makeKeyAndVisible()
        }
        
        
    }
    
    
    func estaVigente()->Bool
    {
        actualizarDatosPaquete()
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

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

