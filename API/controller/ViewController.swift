//
//  ViewController.swift
//  API
//
//  Created by Ahmed abu elregal on 10/27/18.
//  Copyright © 2018 Ahmed abu elregal. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    @IBOutlet weak var tableCars: UITableView!
    
    var newcar = [Car]()

    override func viewDidLoad() {
        tableCars.dataSource = self
        tableCars.delegate = self
        
        
        
        getCar()
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getCar()
    {
        let carUrl = "https://vpic.nhtsa.dot.gov/api/vehicles/getallmakes?format=json&fbclid=IwAR1DAPCCyqr9rK-HZS2p9NaiLAyxGIuglrw0rEnIYKkYcsH4t6bk-i3vbGQ"
        Alamofire.request(carUrl).responseJSON { response in
            print("The respone is : \(response)")
            let result = response.result
            print("The result is : \(result.value!)")
            if let arrayOfDic = result.value as? Dictionary<String, AnyObject>{
                print(arrayOfDic["Results"] as Any)
                let messagedata = arrayOfDic["Results"] as? [[String : Any]]
                for aDic in messagedata! {
                    self.newcar.append(Car(
                        Make_ID : aDic["Make_ID"] as! Int
                        , Make_Name : aDic["Make_Name"] as! String
                    ))
                }
                self.tableCars.reloadData()
                print("\n\n")
                print("The Count is :\(self.newcar.count)")
            }
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newcar.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableCars.dequeueReusableCell(withIdentifier: "carsTableViewCell") as! carsTableViewCell
        cell.lableId.text = "\(newcar[indexPath.row].Make_ID!)"
        cell.lableName.text = newcar[indexPath.row].Make_Name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    


}

