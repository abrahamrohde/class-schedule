//
//  SecondViewController.swift
//  ClassSchedule
//
//  Created by Abraham Rohde on 10/27/15.
//  Copyright © 2015 Abraham Rohde. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController
{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var alreadyTakenLabel: UILabel!
    
    var index : Int!
    var oClass : Class!
    var taken = false

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.titleLabel.text = oClass.title
        self.subjectLabel.text = oClass.subject
        self.courseLabel.text = oClass.course
    }
    
    @IBAction func alreadyTakenButtonPressed(sender: AnyObject)
    {
        if(!taken)
        {
            alreadyTakenLabel.text = "Already taken: YES"
            Singleton.classes.removeAtIndex(index)
            print("Removed! \(index)")
        }
        self.taken = true
    }
    @IBAction func haveNotTakenButtonPressed(sender: AnyObject)
    {
        if(taken)
        {
            alreadyTakenLabel.text = "Already taken:  NO"
            Singleton.classes.insert(oClass, atIndex: index)
            print("Added back in! \(index)")
        }
        self.taken = false
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

