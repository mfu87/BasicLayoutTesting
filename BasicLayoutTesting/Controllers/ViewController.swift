//
//  ViewController.swift
//  BasicLayoutTesting
//
//  Created by Marcus Fuchs on 18.08.19.
//  Copyright © 2019 Marcus Fuchs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set Delegates to self
        myCollectionView.dataSource = self
        myTableView.dataSource = self
        
        //register Custom Cells
        myTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomTableViewCell")
        myCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCustomCollectionViewCell")

        configureTableView()
        
        fillDateArray()
    }
    
    
    
    //MARK:________________GLOBAL VARIABLES________________

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var dateArray = [Date]()
    
    var myCalendar = Calendar.current
    var currentDate = Date()
    
    var dayDictShort: Dictionary = [1: "So", 2: "Mo", 3: "Di", 4: "Mi", 5: "Do", 6: "Fr", 7: "Sa"]
    var dayDictLong: Dictionary = [1: "Sonntag", 2: "Montag", 3: "Dienstag", 4: "Mittwoch", 5: "Donnerstag", 6: "Freitag", 7: "Samstag"]

    
    
    
    
    //MARK:_______________TABLEVIEW DELEGATE METHODS_______________

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dateArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomTableViewCell", for: indexPath) as! TableViewCell
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        cell.date.text = dateFormatter.string(from: dateArray[indexPath.row])
        cell.weekday.text = dayDictLong[myCalendar.component(.weekday, from: dateArray[indexPath.row])]
     
        return cell
    }
    
    
 
    //MARK:_______________COLLECTIONVIEW DELEGATE METHODS_______________
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dateArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCustomCollectionViewCell", for: indexPath) as! CollectionViewCell
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"

        cell.date.text = dateFormatter.string(from: dateArray[indexPath.row])
        cell.weekday.text = dayDictShort[myCalendar.component(.weekday, from: dateArray[indexPath.row])]
        
        return cell
    }
    
    
  
    func configureTableView() {
        
        myTableView.rowHeight = UITableView.automaticDimension
        //myTableView.estimatedRowHeight = 90.0
    }
    
    
    func fillDateArray() {
 
        for n in 0...500 {
            
            //zu current Tage addieren:
            let dateToAdd = myCalendar.date(byAdding: .day, value: n, to: currentDate)
            
            dateArray.append(dateToAdd!)
            
        }
   
    }
    

}

