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
    static var classes = [Class]()
    
    static func configurePrereq(var oClass : Class, cell : ClassCell, cellIndex : Int, indexPathRow : Int)
    {
        var index = -1
        if (oClass.prereq.characters.count > 0)
        {
            index = Singleton.checkClass(oClass.prereq)
        }
        
        if(index == -1)
        {
            //no prereq, or prereq was taken
            cell.configureCell(oClass)
            cell.index = cellIndex + indexPathRow
            
        }
        else
        {
            //There is a prereq for this class so we need to move this on to another semester
            //Singleton.shiftRight(oClass)
            //oClass = Singleton.classes[cellIndex]
            if((cellIndex - index) <= indexPathRow)
            {
                Singleton.shiftRight(oClass)
                oClass = Singleton.classes[indexPathRow + cellIndex]
            }
            cell.configureCell(oClass)
            cell.index = cellIndex + indexPathRow
        }
    }
    
    static func checkClass(course : String) -> Int
    {
        for oClass in Singleton.classes
        {
            print("checkClass \(oClass.title)")
            if(oClass.subject == "CSC" && oClass.course == course)
            {
                oClass.display()
                return Singleton.classes.indexOf(oClass)!
            }
        }
        return -1
    }
    
    static func shiftRight(oClass : Class)
    {
        let index = Singleton.classes.indexOf(oClass)!
        Singleton.classes.removeAtIndex((index))
        Singleton.classes.insert(oClass, atIndex: index+1)
    }
    
    
    static func fillClasses() -> [Class]
    {
        var classes = [Class]()
        classes.append(Class(title: "Foundations of CS", subject: "CSC", course: "150"))
        classes.append(Class(title: "Applied Calculus", subject: "MATH", course: "197"))
        classes.append(Class(title: "Writing", subject: "ENG", course: "104"))
        classes.append(Class(title: "History", subject: "HIST", course: "103"))
        classes.append(Class(title: "Bible", subject: "REL", course: "100"))
        classes.append(Class(title: "Informatics", subject: "CSC", course: "175", prereq: "150"))
        classes.append(Class(title: "Foundations of Programming", subject: "CSC", course: "200"))
        classes.append(Class(title: "Literature", subject: "ENG", course: "103"))
        classes.append(Class(title: "Statistics", subject: "MATH", course: "205"))
        classes.append(Class(title: "Christian faith", subject: "REL", course: "110"))
        classes.append(Class(title: "CS theory practice I", subject: "CSC", course: "250", prereq: "150"))
        classes.append(Class(title: "Discrete", subject: "MATH", course: "220"))
        classes.append(Class(title: "intro to natural science", subject: "SCI", course: "100"))
        classes.append(Class(title: "Speech", subject: "COMM", course: "105"))
        classes.append(Class(title: "Latin I", subject: "LAT", course: "105"))
        classes.append(Class(title: "CS theory practice II", subject: "CSC", course: "300", prereq: "250"))
        classes.append(Class(title: "Software Engineering", subject: "CSC", course: "370", prereq: "250"))
        classes.append(Class(title: "Logic", subject: "PHIL", course: "211"))
        classes.append(Class(title: "intro to econ", subject: "ECON", course: "200"))
        classes.append(Class(title: "General Psych", subject: "PSY", course: "101"))
        classes.append(Class(title: "Lifetime Fitness", subject: "HHP", course: "100"))
        classes.append(Class(title: "organization & architecture", subject: "CSC", course: "325"))
        classes.append(Class(title: "OS", subject: "CSC", course: "350"))
        classes.append(Class(title: "Cosmogony", subject: "SCI", course: "275"))
        classes.append(Class(title: "Minor course", subject: "", course: ""))
        classes.append(Class(title: "Minor course", subject: "", course: ""))
        classes.append(Class(title: "Free elective", subject: "CSC", course: ""))
        classes.append(Class(title: "elective", subject: "CSC", course: ""))
        classes.append(Class(title: "elective", subject: "CSC", course: ""))
        classes.append(Class(title: "ancient world", subject: "HIST", course: "221"))
        classes.append(Class(title: "elective", subject: "REL", course: ""))
        classes.append(Class(title: "GD or ART or MUS", subject: "", course: "100"))
        classes.append(Class(title: "Minor course", subject: "", course: ""))
        classes.append(Class(title: "programming languages", subject: "CSC", course: "470"))
        classes.append(Class(title: "senior seminar I", subject: "CSC", course: "490"))
        classes.append(Class(title: "walking", subject: "HHP", course: "160"))
        classes.append(Class(title: "Minor course", subject: "", course: ""))
        classes.append(Class(title: "Minor course", subject: "", course: ""))
        classes.append(Class(title: "Free elective", subject: "", course: ""))
        classes.append(Class(title: "systems software", subject: "CSC", course: "450"))
        classes.append(Class(title: "senior seminar II", subject: "CSC", course: "491", prereq: "370"))
        classes.append(Class(title: "Minor course", subject: "CSC", course: ""))
        classes.append(Class(title: "Free elective", subject: "CSC", course: ""))
        classes.append(Class(title: "Free elective", subject: "CSC", course: ""))
        return classes
    }
}
