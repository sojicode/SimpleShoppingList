//
//  ViewController.swift
//  Syang A Simple Shopping List
//
//  Created by Sojeong Yang on 2/13/20.
//  Copyright © 2020 DePaul University. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet var textInput: [UITextField]!
    
    @IBOutlet weak var showItem: UILabel!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }
    
    @IBAction func editEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        
        for item in textInput {
            item.resignFirstResponder()
        }
    }
    
    
    @IBAction func newListPressed(_ sender: UIButton) {
        
        showItem.text = "No item"
        
    }
    
    @IBAction func newItemPressed(_ sender: UIButton) {
        
        for item in textInput {
            item.text = ""
        }
    }
    
    func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        
        var itemList : [Int:String] = [:]
        for item in textInput {
            item.resignFirstResponder()
            
            //ensure that neither input is not empty and the quantity field is an integer
            if item.text != "" && isStringAnInt(string: textInput[1].text!){
                if let itemToText = item.text {
                    itemList[item.tag] = itemToText
                }
                
            }
            //alert popup when invalid input and no item will be added
            else if item.text == "" || isStringAnInt(string: textInput[1].text!) == false {
                actionAlert()
            }
            
        }
        
        //remove "No item" when valid input adds
        if showItem.text == "No item" && itemList.count == 2 {
            showItem.text = ""
        }
        
        //when we add items after first line
        if itemList.count == 2 {
        
            if let quan = itemList[2] {
                showItem.text = (showItem.text ?? "") + "\(quan)x"
                
            }
            if let desc = itemList[1] {
                showItem.text = (showItem.text ?? "") + " \(desc)"
            }
            
            showItem.text = (showItem.text ?? "") + "\n"
        }
    }
    
    
    func actionAlert() {
        
        let alertController =
            UIAlertController(title: "Alert",
                              message: "Please check your input again",
                              preferredStyle: .alert)
        let cancelAction =
            UIAlertAction(title: "OK",
                          style: .cancel,
                          handler: nil)
        
        alertController.addAction(cancelAction)
        self.present(alertController,
                     animated: true,
                     completion: nil)
    }
    
}

