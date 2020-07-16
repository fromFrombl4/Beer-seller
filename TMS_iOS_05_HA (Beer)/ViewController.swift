//
//  ViewController.swift
//  TMS_iOS_05_HA (Beer)
//
//  Created by Roman Dod on 7/7/20.
//  Copyright © 2020 Roman Dod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infoClose: UILabel!
    @IBOutlet weak var countBottleLabel: UILabel!
    var currentOrderCount: UInt = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    @IBAction func addBottle() {
        if !Manager.shared.isOpen() {
            return
        }
        if Manager.shared.remainBottles <= currentOrderCount{
            return
        }
        currentOrderCount += 1
        updateCurrentCount()
    }
    
    @IBAction func removeBottle() {
        if !Manager.shared.isOpen() {
            return
        }
        if currentOrderCount == 0{
            return
        }
        currentOrderCount -= 1
        updateCurrentCount()
    }
    
    @IBAction func pressSellButton() {
        if !Manager.shared.isOpen() {
            
            return
        }
        Manager.shared.sellBeer(count: currentOrderCount)
        currentOrderCount = 0
        updateCurrentCount()
        updateCash()
            
    }
    
    @IBAction func pressStartButton() {
        
        Manager.shared.start()
        updateCash()
    
    }
    
    @IBAction func pressCloseButton() {
        
        Manager.shared.close()
        
                    
    }
    
    private func updateCurrentCount(){
        countBottleLabel.text = String(currentOrderCount)
    }
    
    private func updateCash(){
        infoClose.text = String(Manager.shared.cashToday)
    }
    
}

