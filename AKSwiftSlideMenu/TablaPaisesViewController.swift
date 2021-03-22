//
//  TablaPaisesViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/21/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit

class TablaPaisesViewController: UITableViewCell
{
    
    @IBOutlet weak var lblPais: UILabel!
    
    @IBOutlet weak var imgBandera: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
