//
//  ClassCell.swift
//  ClassSchedule
//
//  Created by Abraham Rohde on 10/30/15.
//  Copyright © 2015 Abraham Rohde. All rights reserved.
//

import UIKit

class ClassCell: UICollectionViewCell
{
    @IBOutlet weak var classTitle: UILabel!
    
    func configureCell(oClass: Class)
    {
        self.classTitle.text = oClass.title
        
    }
}
