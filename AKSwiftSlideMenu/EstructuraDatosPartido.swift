//
//  EstructuraEquiposPartido.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/22/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit

public struct EstructuraDatosPartido:Decodable
{
    var liga:String?
    var idPartido:String?
    var idTemporada:String?
    var idEquipoLocal:String?
    var idEquipoVisitante:String?
    var equipoLocal:String?
    var equipoVisitante:String?
    var fecha:String?
    var hora:String?
    var medioTiempoLocal:String?
    var medioTiempoVisitante:String?
    var finalLocal:String?
    var finalVisitante:String?
    var tarjetasLocal:String?
    var tarjetasVisitante:String?
    var cornersMTLocal:String?
    var cornersMTVistante:String?
    var cornersFinalLocal:String?
    var cornersFinalVisitante:String?
    var mediaTarjetasHistH2H:String?
    var mediaTarTALocalCasa:String?
    var mediaTarTALocalFuera:String?
    var mediaTarTALocalGlobal:String?
    var mediaTarTAVisitanteCasa:String?
    var mediaTarTAVisitanteFuera:String?
    var mediaTarTAVisitanteGlobal:String?
    var mediaTarHiLocalCasa:String?
    var mediaTarHiLocalFuera:String?
    var mediaTarHiLocalGlobal:String?
    var mediaTarHiVisitanteCasa:String?
    var mediaTarHiVisitanteFuera:String?
    var mediaTarHiVisitanteGlobal:String?
    var cumplioMediaTarLocal:String?
    var cumplioMediaTarVisitante:String?
    var mediaGolTALocalGlobalFavor:String?
    var mediaGolTALocalGlobalContra:String?
    var mediaGolTAVisitanteGlobalFavor:String?
    var mediaGolTAVisitanteGlobalContra:String?
    var mediaGolTALocalCasaFavor:String?
    var mediaGolTALocalCasaContra:String?
    var mediaGolTAVisitanteFueraFavor:String?
    var mediaGolTAVisitanteFueraContra:String?
    
    var mediaGolTALocalDescanso:String?
    var mediaGolTAVisitanteDescanso:String?
    
    var mediaGolTASumadaDescanso:String?
    var mediaGolTASumadaFinal:String?
    
    var mediaGolHiLocalGlobalFavor:String?
    var mediaGolHiLocalGlobalContra:String?
    var mediaGolHiVisitanteGlobalFavor:String?
    var mediaGolHiVisitanteGlobalContra:String?
    var mediaGolHiLocalCasaFavor:String?
    var mediaGolHiLocalCasaContra:String?
    var mediaGolHiVisitanteFueraFavor:String?
    var mediaGolHiVisitanteFueraContra:String?
    var mediaGolHiLocalDescanso:String?
    var mediaGolHiVisitanteDescanso:String?
    var mediaGolHiSumadaDescanso:String?
    var mediaGolHiSumadaFinal:String?
    var mediaGolH2HDescanso:String?
    var mediaGolH2HFinal:String?
    var cumplioMediaGolLocal:String?
    var cumplioMediaGolVisitante:String?
    
    
    var rachaHiLoPartMaxGanCasa:String?
    var rachaHiLoPartMaxGanFuera:String?
    var rachaHiLoPartMaxGanCF:String?
    var rachaHiLoPartMaxSinPerCasa:String?
    var rachaHiLoPartMaxSinPerFuera:String?
    var rachaHiLoPartMaxSinPerCF:String?
    var rachaHiLoPartMaxSinGanCasa:String?
    var rachaHiLoPartMaxSinGanFuera:String?
    var rachaHiLoPartMaxSinGanCF:String?
    var rachaHiLoPartMaxPerCasa:String?
    var rachaHiLoPartMaxPerFuera:String?
    var rachaHiLoPartMaxPerCF:String?
    var rachaTALoPartMaxGanCasa:String?
    var rachaTALoPartMaxGanFuera:String?
    var rachaTALoPartMaxGanCF:String?
    var rachaTALoPartMaxSinPerCasa:String?
    var rachaTALoPartMaxSinPerFuera:String?
    var rachaTALoPartMaxSinPerCF:String?
    var rachaTALoPartMaxSinGanCasa:String?
    var rachaTALoPartMaxSinGanFuera:String?
    var rachaTALoPartMaxSinGanCF:String?
    var rachaTALoPartMaxPerCasa:String?
    var rachaTALoPartMaxPerFuera:String?
    var rachaTALoPartMaxPerCF:String?
    
    
    
    var rachaHiViPartMaxGanCasa:String?
    var rachaHiViPartMaxGanFuera:String?
    var rachaHiViPartMaxGanCF:String?
    var rachaHiViPartMaxSinPerCasa:String?
    var rachaHiViPartMaxSinPerFuera:String?
    var rachaHiViPartMaxSinPerCF:String?
    var rachaHiViPartMaxSinGanCasa:String?
    var rachaHiViPartMaxSinGanFuera:String?
    var rachaHiViPartMaxSinGanCF:String?
    var rachaHiViPartMaxPerCasa:String?
    var rachaHiViPartMaxPerFuera:String?
    var rachaHiViPartMaxPerCF:String?
    var rachaTAViPartMaxGanCasa:String?
    var rachaTAViPartMaxGanFuera:String?
    var rachaTAViPartMaxGanCF:String?
    var rachaTAViPartMaxSinPerCasa:String?
    var rachaTAViPartMaxSinPerFuera:String?
    var rachaTAViPartMaxSinPerCF:String?
    var rachaTAViPartMaxSinGanCasa:String?
    var rachaTAViPartMaxSinGanFuera:String?
    var rachaTAViPartMaxSinGanCF:String?
    var rachaTAViPartMaxPerCasa:String?
    var rachaTAViPartMaxPerFuera:String?
    var rachaTAViPartMaxPerCF:String?

     var mediaCorTALocalGlobalFavor:String?
    var mediaCorTALocalGlobalContra:String?
    var mediaCorTAVisitanteGlobalContra:String?
    var mediaCorTAVisitanteGlobalFavor:String?
    var mediaCorTALocalCasaFavor:String?
    var mediaCorTALocalCasaContra:String?
    var mediaCorTAVisitanteFueraFavor:String?
    var mediaCorTAVisitanteFueraContra:String?
    var mediaCorTALocalDescanso:String?
    var mediaCorTAVisitanteDescanso:String?
    var mediaCorTASumadaDescanso:String?
    var mediaCorTASumadaFinal:String?
    var mediaCorHiLocalGlobalFavor:String?
    var mediaCorHiLocalGlobalContra:String?
    var mediaCorHiVisitanteGlobalFavor:String?
    var mediaCorHiVisitanteGlobalContra:String?
    var mediaCorHiLocalCasaFavor:String?
    var mediaCorHiLocalCasaContra:String?
    var mediaCorHiVisitanteFueraFavor:String?
    var mediaCorHiVisitanteFueraContra:String?
    var mediaCorHiLocalDescanso:String?
    var mediaCorHiVisitanteDescanso:String?
    var mediaCorHiSumadaDescanso:String?
    var mediaCorHiSumadaFinal:String?
    var mediaCorHHDescanso:String?
    var mediaCorHHFinal:String?
    var cumplioMediaCorLocal:String?
    var cumplioMediaCorVisitante:String?
    var idEquipoFavorito:String?
    var resultadoPartido:String?
    var puntosResultadoPartido:String?
    var golesAlDescanso:String?
    var golesAlFinal:String?
    var cantidadGoles:String?
    var tarjetasPositivo:String?
    var tarjetasNegativo:String?
    var cornersPositivo:String?
    var cornersNegativo:String?
    
    
    
    
    
    
    
  
    
    
}
