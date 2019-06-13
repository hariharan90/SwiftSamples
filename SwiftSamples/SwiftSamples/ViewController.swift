//
//  ViewController.swift
//  SwiftSamples
//
//  Created by Hari on 12/06/19.
//  Copyright © 2019 Hari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var StringArray = [Int]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for num in 1...10{
            self.StringArray .append(num)
        }

        self.tableView?.delegate = self
        self.tableView?.dataSource = self
    }
    //TableViewDataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :HomeCellVC =  tableView.dequeueReusableCell(withIdentifier: "homeCellVC", for: indexPath) as! HomeCellVC
       // let cell : UITableViewCell  = self.tableView?.dequeueReusableCell(withIdentifier: "homeCellVC") as! HomeCellVC
        
        cell.nameLbl?.text = "Hari On Nama shivaya!!!"
        return cell
    }
    
    


}

