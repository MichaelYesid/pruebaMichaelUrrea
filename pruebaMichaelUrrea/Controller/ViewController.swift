//
//  ViewController.swift
//  pruebaMichaelUrrea
//
//  Created by Michaelu on 13/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    let parser = Parser()
    var acron = [LF]()
    @IBOutlet weak var textSearch: UITextField!
    @IBOutlet weak var buttonSearch: UIButton!
    @IBOutlet weak var load: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.load.isHidden = true
        tableView.dataSource = self
    }
    
    
    @IBAction func findAcron(_ sender: Any) {
        
        let textField = self.textSearch.text ?? ""
        self.load.isHidden = false
        self.load.startAnimating()
        
        parser.parse(textFind: textField){
            data in
            self.acron = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.load.stopAnimating()
                self.load.isHidden = true
            }
            
        }
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return acron.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = acron[indexPath.row].lf
        //cell.detailTextLabel?.text = String(object.freq ?? "Desc aca")
        
        return cell
    }
    
    
}
