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
    var classes = Singleton.fillClasses()
    
    var defaultSize : CGFloat = 20
    var focusedSize : CGFloat = 30
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        collectionView.delegate = self
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
            
            let oClass = classes[indexPath.row]
            cell.configureCell(oClass)
            
            return cell
        }
        else
        {
            return ClassCell()
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return classes.count
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
                //prev.classTitle.frame.size = self.defaultSize
                prev.classTitle.font = UIFont(name: prev.classTitle.font.fontName, size: self.defaultSize)
                //UIFont(name: label.font.fontName, size: 20)
            })
        }
        if let next = context.nextFocusedView as? ClassCell
        {
            UIView.animateWithDuration(0.1, animations: {() -> Void in
                //next.classTitle.frame.size = self.focusedSize
                next.classTitle.font = UIFont(name: next.classTitle.font.fontName, size: self.focusedSize)
            })
        }
    }
    
    

}

