//
//  FirstViewController.swift
//  ClassSchedule
//
//  Created by Abraham Rohde on 10/27/15.
//  Copyright © 2015 Abraham Rohde. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    var defaultSize : CGFloat = 18
    var focusedSize : CGFloat = 40
    
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    override func viewWillAppear(animated: Bool) {
        self.collectionView.reloadData()
        print("in viewWillAppear")
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ClassCell", forIndexPath: indexPath) as? ClassCell
        {
            
            if(indexPath.section == 0)
            {
                Singleton.configurePrereq(Singleton.classes[indexPath.row], cell: cell, cellIndex: 0, indexPathRow: indexPath.row)
            }
            else if(indexPath.section == 1)
            {
                Singleton.configurePrereq(Singleton.classes[indexPath.row + 5], cell: cell, cellIndex: 5, indexPathRow: indexPath.row)
                //var oClass = Singleton.classes[indexPath.row + 5]
                //cell.configureCell(oClass)
                //cell.index = indexPath.row + 5
                //print(indexPath.row + 5)
                /*
                
                var index = -1
                if (oClass.prereq.characters.count > 0)
                {
                    oClass.display()
                    index = Singleton.checkClass(oClass.prereq)
                }
                
                if(index == -1)
                {
                    //no prereq, or prereq was taken
                    cell.configureCell(oClass)
                    cell.index = indexPath.row + 5
                    
                }
                else
                {
                    //There is a prereq for this class so we need to move this on to another semester
                    if((5 - index) <= indexPath.row)
                    {
                        Singleton.shiftRight(oClass)
                        oClass = Singleton.classes[indexPath.row + 5]
                    }
                    cell.configureCell(oClass)
                    cell.index = indexPath.row
                }
                */
                
            }
            else if(indexPath.section == 2)
            {
                Singleton.configurePrereq(Singleton.classes[indexPath.row + 10], cell: cell, cellIndex: 10, indexPathRow: indexPath.row)
                /*
                let oClass = Singleton.classes[indexPath.row + 10]
                cell.configureCell(oClass)
                cell.index = indexPath.row + 10
                //print(Singleton.classes.indexOf(oClass))
                print(indexPath.row + 10)
                */
            }
            else if(indexPath.section == 3)
            {
                Singleton.configurePrereq(Singleton.classes[indexPath.row + 15], cell: cell, cellIndex: 15, indexPathRow: indexPath.row)
                /*
                let oClass = Singleton.classes[indexPath.row + 15]
                cell.configureCell(oClass)
                cell.index = indexPath.row + 15
                print(indexPath.row + 15)
                */
            }
            else if(indexPath.section == 4)
            {
                Singleton.configurePrereq(Singleton.classes[indexPath.row + 21], cell: cell, cellIndex: 21, indexPathRow: indexPath.row)
                /*
                let oClass = Singleton.classes[indexPath.row + 21]
                cell.configureCell(oClass)
                cell.index = indexPath.row + 21
                print(indexPath.row + 21
                */
            }
            else if(indexPath.section == 5)
            {
                Singleton.configurePrereq(Singleton.classes[indexPath.row + 27], cell: cell, cellIndex: 27, indexPathRow: indexPath.row)
                /*
                let oClass = Singleton.classes[indexPath.row + 27]
                cell.configureCell(oClass)
                cell.index = indexPath.row + 27
                print(indexPath.row + 27)
                */
            }
            else if(indexPath.section == 6)
            {
                Singleton.configurePrereq(Singleton.classes[indexPath.row + 33], cell: cell, cellIndex: 33, indexPathRow: indexPath.row)
                /*
                let oClass = Singleton.classes[indexPath.row + 33]
                cell.configureCell(oClass)
                cell.index = indexPath.row + 33
                print(indexPath.row + 33)
                */
            }
            else if(indexPath.section == 7)
            {
                Singleton.configurePrereq(Singleton.classes[indexPath.row + 39], cell: cell, cellIndex: 39, indexPathRow: indexPath.row)
                /*
                let oClass = Singleton.classes[indexPath.row + 39]
                cell.configureCell(oClass)
                cell.index = indexPath.row + 39
                print(indexPath.row + 39)
                */
            }
            
            
            
            
            
            
            
            if cell.gestureRecognizers?.count == nil
            {
                let tap = UITapGestureRecognizer(target: self, action: "tapped:")
                tap.allowedPressTypes = [NSNumber(integer: UIPressType.Select.rawValue)]
                cell.addGestureRecognizer(tap)
            }
            return cell
        }
        else
        {
            return ClassCell()
        }
    }
    
    func tapped(gesture: UIGestureRecognizer)
    {
        
        if let cell = gesture.view as? ClassCell
        {
            if let secondView = self.storyboard?.instantiateViewControllerWithIdentifier("secondViewController") as? SecondViewController
            {
                secondView.oClass = cell.oClass
                secondView.index = cell.index
                
                self.presentViewController(secondView, animated: true, completion: {() -> Void in
                    //self.collectionView.reloadData()
                })
            }
            
            //self.navigationController?.pushViewController(secondView, animated: true)
            
            
            
            //secondView.performSegueWithIdentifier("secondViewController", sender: self)
            //self.presentViewController(SVC, animated: true, completion: {() -> Void in
                
            //})

            //self.performSegueWithIdentifier("secondViewController", sender: "SENDER")
            
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        
        return 8
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        //return Singleton.classes.count
        if(section == 0)
        {
            if(Singleton.classes.count >= 5)
            {
                return 5
            }
            else
            {
                return Singleton.classes.count
            }
        }
        else if(section == 1)
        {
            if(Singleton.classes.count >= 10)
            {
                return 5
            }
            else if(Singleton.classes.count < 10 && Singleton.classes.count >= 5)
            {
                return Singleton.classes.count - 5
            }
            else
            {
                return 0
            }
        }
        else if(section == 2)
        {
            if(Singleton.classes.count >= 15)
            {
                return 5
            }
            else if(Singleton.classes.count < 15 && Singleton.classes.count >= 10)
            {
                return Singleton.classes.count - 10
            }
            else
            {
                return 0
            }
        }
        else if(section == 3)
        {
            if(Singleton.classes.count >= 21)
            {
                return 6
            }
            else if(Singleton.classes.count < 21 && Singleton.classes.count >= 15)
            {
                return Singleton.classes.count - 15
            }
            else
            {
                return 0
            }
        }
        else if(section == 4)
        {
            if(Singleton.classes.count >= 27)
            {
                return 6
            }
            else if(Singleton.classes.count < 27 && Singleton.classes.count >= 21)
            {
                return Singleton.classes.count - 21
            }
            else
            {
                return 0
            }
        }
        else if(section == 5)
        {
            if(Singleton.classes.count >= 33)
            {
                return 6
            }
            else if(Singleton.classes.count < 33 && Singleton.classes.count >= 27)
            {
                return Singleton.classes.count - 27
            }
            else
            {
                return 0
            }
        }
        else if(section == 6)
        {
            if(Singleton.classes.count >= 39)
            {
                return 6
            }
            else if(Singleton.classes.count < 39 && Singleton.classes.count >= 33)
            {
                return Singleton.classes.count - 33
            }
            else
            {
                return 0
            }
        }
        else if(section == 7)
        {
            if(Singleton.classes.count >= 44)
            {
                return 5
            }
            else if(Singleton.classes.count < 44 && Singleton.classes.count >= 39)
            {
                return Singleton.classes.count - 39
            }
            else
            {
                return 0
            }
        }
        return 0
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSizeMake(336, 285)
    }
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator)
    {
        if let prev = context.previouslyFocusedView as? ClassCell
        {
            UIView.animateWithDuration(0.1, animations: {() -> Void in
                prev.classTitle.font = UIFont(name: prev.classTitle.font.fontName, size: self.defaultSize)
            })
        }
        if let next = context.nextFocusedView as? ClassCell
        {
            UIView.animateWithDuration(0.1, animations: {() -> Void in
                next.classTitle.font = UIFont(name: next.classTitle.font.fontName, size: self.focusedSize)
            })
        }
    }
    
    

}

