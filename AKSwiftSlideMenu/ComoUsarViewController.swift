//
//  ComoUsarViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/25/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit
import SafariServices


class ComoUsarViewController : UIViewController
{
    
    @IBAction func btnInstagram(_ sender: UIButton) {
        guard let url = URL(string: "https://www.instagram.com/betdatanalysis/?hl=es") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnComoUsar(_ sender: UIButton) {
        guard let url = URL(string: "http://betdatanalysis.com/doctos/ComoUsarElAnalisis.pdf") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnDatosDirecto(_ sender: UIButton) {
        guard let url = URL(string: "http://betdatanalysis.com/doctos/DatosParaDirectos.pdf") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
}
