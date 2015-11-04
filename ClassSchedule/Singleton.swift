//
//  Singleton.swift
//  ClassSchedule
//
//  Created by Abraham Rohde on 10/31/15.
//  Copyright © 2015 Abraham Rohde. All rights reserved.
//

import UIKit

class Singleton: NSObject
{
    static func fillClasses() -> [Class]
    {
        var classes = [Class]()
        for( var i = 1; i < 100; i++)
        {
            let oClass = Class(title: "Test \(i)", subject: "CSC", course: "\(i)0")
            classes.append(oClass)
        }
        return classes
    }
}
