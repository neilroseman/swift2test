//
//  ViewController.swift
//  swift2test
//
//  Created by NEIL ROSEMAN on 12/9/15.
//  Copyright © 2015 NEIL ROSEMAN. All rights reserved.
//

import UIKit
import AVFoundation

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
    var firstTime = false
    var randNum = Int(arc4random_uniform(3)) + 1
    var newTrash = Trash(number: 3)
    var ding:AVAudioPlayer = AVAudioPlayer()


    
    // This is a piece of trash!
    struct Trash {
        //<#properties and methods#>
        var type : TrashTypes
        // add a var for the display name of the trash
        var name: String
        var compostNames = ["Banana", "Pizza", "Corn dog", "Lettuce", "Egg Shells", "Apple Core"]
        var recycleNames = ["Foil Trays (flattened)", "Glass Bottle", "Phone Book", "Cardboard Box", "Newpaper", "Aluminum Can" ]
        var garbageNames = ["CD", "Cloth", "Dirt", "DVDs", "Animal Waste", "Ceramics"]

        
        init(number :Int) {
       let randNum = Int(arc4random_uniform(6))
 
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
        
        //let randNum = Int(arc4random_uniform(3)) + 1
       // let newTrash = Trash(number: randNum)
        
        //print(newTrash.type)
        // TrashName.text = String(newTrash.type)
        TrashName.text = "Click a button to start";
      //  total = total - 1;
        firstTime = true
       
    
    
    
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func TrashButtonPressed(sender: AnyObject) {
    
        func playSound(soundName: String)
        {
            let coinSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(soundName, ofType: "aiff")!)
            do{
                let audioPlayer = try AVAudioPlayer(contentsOfURL:coinSound)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            }catch {
                print("Error getting the audio file")
            }
        }
        
    if firstTime == true {
        let title = sender.titleForState(.Normal)
      //  print("Title", title)
      //  print (TrashName.text)
      if title == TrashName.text {
            correct = correct+1
        }
         randNum = Int(arc4random_uniform(3)) + 1
         newTrash = Trash(number: randNum)
         TrashName.text = String(newTrash.name)
        firstTime = false
        }
        
    else {
        let title = sender.titleForState(.Normal)
        
             randNum = Int(arc4random_uniform(3)) + 1
        
     //   print("Else Title", title)
     //   print("Name", TrashName.text)
     //   print("type", newTrash.type)
        if title == String(newTrash.type) {
            correct = correct+1
  //          playSound("/System/Library/Sounds/Ping.aiff")
        }
        total++
        newTrash = Trash(number: randNum)
        TrashName.text = String(newTrash.name)

        }
        
        totNum.text = String(total)
        correctNum.text = String(correct)
        
    }
    
}

