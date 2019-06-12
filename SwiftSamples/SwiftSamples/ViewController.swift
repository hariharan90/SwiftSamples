//
//  ViewController.swift
//  SwiftSamples
//
//  Created by Hari on 12/06/19.
//  Copyright © 2019 Hari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    weak var tableView  = UITableView ()
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
    
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StringArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell  = self.tableView?.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = "hari"
        return cell
    }
    
    


}

