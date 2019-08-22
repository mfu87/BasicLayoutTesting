//
//  TableViewCell.swift
//  BasicLayoutTesting
//
//  Created by Marcus Fuchs on 19.08.19.
//  Copyright © 2019 Marcus Fuchs. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var weekday: UILabel!
    @IBOutlet weak var offblockTime: UILabel!
    @IBOutlet weak var onblockTime: UILabel!
    @IBOutlet weak var routing: UILabel!
    @IBOutlet weak var flightnumber: UILabel!
    @IBOutlet weak var registration: UILabel!
    @IBOutlet weak var landings: UILabel!
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
