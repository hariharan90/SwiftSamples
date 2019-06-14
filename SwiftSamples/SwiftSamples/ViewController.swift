//
//  ViewController.swift
//  SwiftSamples
//
//  Created by Hari on 12/06/19.
//  Copyright © 2019 Hari. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var StringArray = [Int]()
     var name = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for num in 1...10{
            self.StringArray .append(num)
        }

        self.navigationItem.title = "Sampel Swift"
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        self.fetchFromDb()
    }
    //TableViewDataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :HomeCellVC =  tableView.dequeueReusableCell(withIdentifier: "homeCellVC", for: indexPath) as! HomeCellVC
       // let cell : UITableViewCell  = self.tableView?.dequeueReusableCell(withIdentifier: "homeCellVC") as! HomeCellVC
        
        cell.nameLbl?.text = name[indexPath.row]
        return cell
    }
    
    func fetchFromDb(){
        guard  let appdelgate : AppDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let manageContext = appdelgate.persistentContainer.viewContext
        
        let fetchRequest  = NSFetchRequest<NSFetchRequestResult>(entityName: "Albums")
       
        do{
            let albums = try!manageContext.fetch(fetchRequest)
            for data in albums as! [NSManagedObject]{
                name.append(data.value(forKey: "title") as! String)
            }
            self.tableView.reloadData()
            
        }
        catch let error as NSError{
            print("\(error.userInfo)")
        }
        
       
    }
    
    @IBAction func saveToDb(){
        guard let appdelgate:AppDelegate = UIApplication.shared.delegate as! AppDelegate else {
            return
        }
        let manageContext = appdelgate.persistentContainer.viewContext
        
        let albumEntity = NSEntityDescription.entity(forEntityName: "Albums", in: manageContext)
        
        let album = NSManagedObject.init(entity: albumEntity!, insertInto: manageContext)
        album.setValue("Blank Space", forKey: "title")
        album.setValue("Taylor", forKey: "lyrics")
        album.setValue(5, forKey: "star")
        album.setValue("thumbnail", forKey: "thumnail")
        album.setValue("Taylor Swift", forKey: "author")
        
        do {
            try manageContext.save()
        }
        catch let error as NSError{
            print("\(error) , \(error.userInfo)")
        }
    }
    


}

