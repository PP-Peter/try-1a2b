//
//  ViewController.swift
//  try 1a2b
//
//  Created by Peter Ding on 2018/11/25.
//  Copyright © 2018 PeterDing. All rights reserved.
//
// learning git version

import UIKit
import GameplayKit

class ViewController: UIViewController {

    
    @IBOutlet weak var list: UITextView!
    
    @IBOutlet weak var abList: UITextView!
    @IBOutlet weak var aTextField: UITextField!
 
    var historyTextList = ""
    var ansNumber = ["","",""]
    var historyABList = ""
    var a1Text = ""
    var countFlag = 0
    
    
    @IBAction func aButton(_ sender: UIButton) {
        checkAB()

        
    }
    
    
    func pickAnswer() {
        let shuffled = GKShuffledDistribution (lowestValue: 0, highestValue: 9)
        for num in 0...2 {
            ansNumber[num] = "\(shuffled.nextInt())"
            }
        print ("答案\(ansNumber)")
 
    }
    
   
    func checkAB(){

        var ansA = 0
        var ansB = 0
        var positon = 0
        
       a1Text = aTextField.text!
 
        for charNumber in a1Text {
            
            let number = String(charNumber)
            
            if ansNumber[positon] == number {
                ansA += 1
                
            } else if ansNumber.contains(number) {
                ansB += 1
                
            }else {
                // 不作為。。。
            }
            positon += 1
        
        }
        
      
        

        historyTextList =  historyTextList + a1Text
        historyABList = historyABList + "\(ansA)A\(ansB)B"
        list.text = historyTextList
        countFlag += 1
        abList.text = historyABList
        aTextField.text = ""
        
        if ansA == 3 {
            let alertController = UIAlertController(title: "答對了！猜了\(countFlag) 次", message: "答案就是   \(a1Text)  ", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "重玩一次？", style: .default, handler: nil)
            let okAction = UIAlertAction(title: "👀 重玩一次？🎈", style: .default, handler: { (UIAlertAction) in
                self.resetGame() })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
//            resetGame()
        }
        
    } // func checkAB
    
    func resetGame(){
        historyTextList = ""
        ansNumber = ["","",""]
        historyABList = ""
        a1Text = ""
        list.text = ""
        abList.text = ""
        countFlag = 0
        
        pickAnswer()
        
    }
    

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //**== 在viewdidload 這裏 是沒有作用的。。。。因為life 週期的問題，要放到 viewdidAppear
        // Welcome alert  message
//        let welcomeMsg = UIAlertController(title: "歡迎來到銘銘的幾A幾B", message: "請輸入 3 位數字", preferredStyle: .alert)
//        let BeginMSG = UIAlertAction(title: "？🅰️？🅱️開始🎊📲🚀", style: .default, handler: nil)
//        welcomeMsg.addAction(BeginMSG)
//        self.present(welcomeMsg, animated: true, completion: nil)
        
        
        
        pickAnswer()
       
        // Do any additional setup after loading the view, typically from a nib.
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let welcomeMsg = UIAlertController(title: "歡迎來到銘銘的幾A幾B", message: "請輸入 3 位數字", preferredStyle: .alert)
        let BeginMSG = UIAlertAction(title: "？🅰️？🅱️ 開始  ✅", style: .default, handler: nil)
        welcomeMsg.addAction(BeginMSG)
        self.present(welcomeMsg, animated: true, completion: nil)
        
        
    }
}
