//
//  ViewController.swift
//  swift2test
//
//  Created by NEIL ROSEMAN on 12/9/15.
//  Copyright © 2015 NEIL ROSEMAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TrashName: UILabel!
    @IBOutlet weak var correctNum: UILabel!
    @IBOutlet weak var totNum: UILabel!
    enum TrashTypes : String{
       
        case Compost
        case Recycle
        case Garbage
    }
    
    var total = 0
    var correct = 0
    
    // This is a piece of trash!
    struct Trash {
        //<#properties and methods#>
        var type : TrashTypes
        // add a var for the display name of the trash
        var name: String
        var compostNames = ["banana", "pizza", "corn dog"]
        var recycleNames = ["plastic", "glass", "paper"]
        var garbageNames = ["foil", "cloth", "dirt"]

        
        init(number :Int) {
       let randNum = Int(arc4random_uniform(3))
        if number == 1 {
           type = TrashTypes.Compost
            //pick a compost name
           name = compostNames[randNum]
        } else if number == 2 {
            type = TrashTypes.Recycle
            // pick a recyclable
            name = recycleNames[randNum]

            }
        else {
            type = TrashTypes.Garbage
            // pick a garbage
            name = garbageNames[randNum]

            }
        
        }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let randNum = Int(arc4random_uniform(3)) + 1
        let newTrash = Trash(number: randNum)
        
        //print(newTrash.type)
        TrashName.text = String(newTrash.type)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func TrashButtonPressed(sender: AnyObject) {
    
        let title = sender.titleForState(.Normal)
        
        
        if title == TrashName.text {
            correct = correct+1
        }
        total++
        let randNum = Int(arc4random_uniform(3)) + 1
        let newTrash = Trash(number: randNum)
        
        //print(newTrash.type)
        TrashName.text = String(newTrash.type)
        totNum.text = String(total)
        correctNum.text = String(correct)
        
    }
    
}

