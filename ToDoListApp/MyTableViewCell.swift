//
//  MyTableViewCell.swift
//  ToDoListApp
//
//  Created by David Gudeman on 2/2/15.
//  Copyright (c) 2015 David Gudeman. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImage:UIImageView!
    @IBOutlet weak var cellItemName: UILabel!
    @IBOutlet weak var cellItemType: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
