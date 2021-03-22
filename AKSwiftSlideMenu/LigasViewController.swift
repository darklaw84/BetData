

import UIKit

 var ligas = [EstructuraEquiposPartido]()
class LigasViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return ligas.count
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let ut = Utils()
        let cell = Bundle.main.loadNibNamed("LigasTVCTableViewCell", owner: self, options: nil)?.first as! LigasTVCTableViewCell
        
        cell.lblLigaLiga.text=ligas[indexPath.row].liga
        cell.lblPaisLiga.text=ligas[indexPath.row].pais
        cell.imgBanderaLiga.image = UIImage(named: ligas[indexPath.row].pais!+".png")
        
        if indexPath.row % 2 == 0
        {
            cell.backgroundColor = ut.colorUIHex(hex: "F6F3F0")
            cell.viewBandera.backgroundColor=ut.colorUIHex(hex: "F6F3F0")
            cell.viewLiga.backgroundColor=ut.colorUIHex(hex: "F6F3F0")
            cell.viewPais.backgroundColor=ut.colorUIHex(hex: "F6F3F0")
        }
        else
        {
            cell.backgroundColor = ut.colorUIHex(hex: "FFFFFF")
            cell.viewBandera.backgroundColor=ut.colorUIHex(hex: "FFFFFF")
            cell.viewLiga.backgroundColor=ut.colorUIHex(hex: "FFFFFF")
            cell.viewPais.backgroundColor=ut.colorUIHex(hex: "FFFFFF")
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addSlideMenuButton()
        addCalendarButton(fecha: dia)
        armarLigas()
        
        // Do any additional setup after loading the view.
    }
    
    func armarLigas()
    {
        ligas = [EstructuraEquiposPartido]()
        if todos.count > 0
        {
            for p in todos
            {
                if p.pais != nil
                {
                    if p.pais == paises[indexSelected].pais
                    {
                        
                        if ligas.count > 0
                        {
                            var encontrado = false
                            for l in ligas
                            {
                                if  l.liga != nil && p.liga != nil
                                {
                                    if  l.idLiga == p.idLiga
                                    {
                                        encontrado=true
                                    }
                                }
                            }
                            
                            if !encontrado
                            {
                                ligas.append(p)
                            }
                        }
                        else
                        {
                            ligas.append(p)
                        }
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
        indexLigaSelected=indexPath.row
        performSegue(withIdentifier: "irPartidos", sender: "self")
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
