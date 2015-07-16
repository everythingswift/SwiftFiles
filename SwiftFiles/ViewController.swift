//
//  ViewController.swift
//  SwiftFiles
//
//  Created by Sridhar Sanapala on 7/16/15.
//  Copyright (c) 2015 everythingswift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var everythingSwiftFilePath:String!;
    
    required init(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Verify if a file exists.
        
        let fileManager = NSFileManager.defaultManager()
        var documentsDirectoryPath:String = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
        everythingSwiftFilePath = documentsDirectoryPath + "everythingswift.txt"

        if(fileManager.fileExistsAtPath(everythingSwiftFilePath))
        {
            println("File everythingswift.txt exists")
        }
        else
        {
            println("File everythingswift.txt does not exist!")
            //Create a text file
            self.createFile()
        }
        
        if(fileManager.fileExistsAtPath(documentsDirectoryPath))
        {
            self.readFile()
            self.writeToFile()
            self.deleteFile()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createFile(){
        println("Creating File")
        
        var contents = "Contents of everythingswift.txt line 1"
        contents.writeToFile(everythingSwiftFilePath, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
        
    }

    func readFile(){
        let fileManager = NSFileManager.defaultManager()
        let contentString = NSString(contentsOfFile: everythingSwiftFilePath, encoding: NSUTF8StringEncoding, error: nil)
        println(contentString)
    }
    
    func writeToFile(){
        let fileManager = NSFileManager.defaultManager()
        var contents = "Second version of everythingswift.txt line 1"
        contents.writeToFile(everythingSwiftFilePath, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
        self.readFile()
    }
    
    func deleteFile(){
        let fileManager = NSFileManager.defaultManager()
        fileManager.removeItemAtPath(everythingSwiftFilePath, error: nil)
    }
}

