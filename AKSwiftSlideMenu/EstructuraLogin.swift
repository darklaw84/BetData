//
//  EstructuraLogin.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/15/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit

public struct EstructuraLogin:Decodable
{
    let idUsuario:integer_t
    let usuario:String?
    let correo:String?
    let validado:String?
    let codValidacion:String?
    let serieActual:String?
    let paquete:String?
    let fechaPaquete:String?
    let error:String?
    let codigoAmistad:String?
    let amigosbuenPedo:String?
    let fechaCreacion:String?
    let token:String?
    
}
