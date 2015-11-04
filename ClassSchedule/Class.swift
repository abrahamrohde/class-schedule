//
//  Class.swift
//  ClassSchedule
//
//  Created by Abraham Rohde on 10/27/15.
//  Copyright © 2015 Abraham Rohde. All rights reserved.
//

import UIKit

class Class: NSObject
{
    var title : String
    var subject : String
    var course : String
    
    override init()
    {
        self.title = ""
        self.subject = ""
        self.course = ""
    }
    init(title : String, subject : String, course : String)
    {
        self.title = title
        self.subject = subject
        self.course = course
    }
}
