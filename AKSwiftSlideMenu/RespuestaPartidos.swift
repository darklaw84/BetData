//
//  RespuestaPartidos.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 30/11/20.
//  Copyright © 2020 Kode. All rights reserved.
//

import UIKit

public struct RespuestaPartidos:Decodable
{
    var mensaje:String?
    var exito:Bool?
    var datos : [EstructuraEquiposPartido]
    
}
