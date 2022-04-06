//
//  Page3ViewController.swift
//  Calculator
//
//  Created by Macservis on 14/02/22.
//

import UIKit

class Page3ViewController: UIViewController {
    //outlets
    @IBOutlet weak var Sarlavha: UILabel!
    
    @IBOutlet weak var ResultLabel: UILabel!
    
    @IBOutlet var ButtonOutlets: [UIButton]!
    
    @IBOutlet weak var ACButtonoutlet: UIButton!
    
    @IBOutlet weak var Imageviewoutlet: UIImageView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tayyorla()
        
       
    }

  
// Identifier
    var bool_AC = true, S1:Double = 0.0, S2 = 0.0, boolAmal = false, amal = "", boolAmal2 = false, boolequal = true,boolError = true
      
 
    
//functions
    
//view
    @objc func SarlavhaClick(_ sender: UITapGestureRecognizer){
        let alert = UIAlertController(title: "INFORMATION", message: "This is create SAMANDARBEK", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func tayyorla() {
        
       
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(Page3ViewController.SarlavhaClick(_:)))
        Sarlavha.isUserInteractionEnabled = true
        Sarlavha.addGestureRecognizer(tap)
        
    
        
        Sarlavha.font = Sarlavha.font.withSize(40)
        Sarlavha.text = "Calculator"
        Sarlavha.textColor = UIColor.black
        
        
        ResultLabel.font = ResultLabel.font.withSize(40)
        ResultLabel.text = "0"
        ResultLabel.textColor = .black
        
        
        Imageviewoutlet.image = UIImage(named: "launch7")
        
        
    for button in ButtonOutlets {
    
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        
        button.titleLabel?.font =  button.titleLabel?.font.withSize(20)
        
            switch button.titleLabel?.text {
            case "+/-","%":
                button.backgroundColor = .gray
                button.setTitleColor(.label, for: .normal)
            case "1","2","3","4","5","6","7","8","9","0","->",".":
                button.backgroundColor = .black
            case "+","-","x","/","=":
                button.backgroundColor = .systemOrange
                button.setTitleColor(.blue, for: .normal)
            default:
                button.backgroundColor = .systemOrange
                button.setTitleColor(.red, for: .normal)
            }
            
        }
        
        
        
    }
//backent
    func Remoove(_ str: String) -> String {
        var str2 = str
        str2.removeLast()
        return str2
    }
    
    func Rostla(_ bool: Bool) {
        if bool {
        ResultLabel.text = "0"
            boolAmal = false
        }
    }
    
    func Amal(_ Sum1: Double,_ Sum2: Double,amal:String){
        var S = 0.0, Result = Sum2
        
        switch amal {
        case "+":
            if boolequal {
            S = Sum1 + Sum2
            }else {
            S = Sum1 + Result
            }
        case "-":
            if boolequal {
            S = Sum1 - Sum2
            }else {
                S = Sum1 - Result
            }
        case "x":
            if boolequal {
            S = Sum1 * Sum2
            }else {
                S = Sum1 * Result
            }
        case "/":
            if Sum2 != 0.0 || Result != 0.0{
                if boolequal {
                    S = Sum1 / Sum2
                }else {
            S = Sum1 / Result
                }
            }
        default:
            break
        }
        if Double(Int.max) < S {
            let alert = UIAlertController(title: "ERROR", message: "The value is much greater", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
           S = 0.0
        }
        if S - Double(Int(S)) == 0.0  {
            ResultLabel.text = "\(Int(S))"
        }else {
            ResultLabel.text = "\(Float(S))"
        }
        
        S1 = S
        boolequal = false
            }
    
   
    
    
//Actions
    @IBAction func InsertButtonInLabel(_ sender: UIButton) {
       
        
        if ResultLabel.text!.count >= 11 {
            if boolError {
                let alert = UIAlertController(title: "Error", message: "The value is much greater", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                present(alert, animated: true, completion: nil)
                    boolError = false
            }else {
                ResultLabel.text = "0"
                  boolError = true
            }
        }
        
        switch sender.titleLabel?.text {

        
        case "C","AC":
            ResultLabel.text = "0"
            ACButtonoutlet.setTitle("AC", for: .normal)
            bool_AC = false
            S2 = 0.0;S1 = 0.0;boolAmal = false;boolAmal2 = false
            
            
//
        case "1","2","3","4","5","6","7","8","9","0":
            Rostla(boolAmal)
            if ResultLabel.text != "0" {
                ResultLabel.text?.append((sender.titleLabel?.text)!)
            }else {
                ResultLabel.text = sender.titleLabel?.text
            }
            bool_AC = true
            
            
            
//
        case ".":
            Rostla(boolAmal)
            if  !(ResultLabel.text?.contains("."))! {
            ResultLabel.text?.append(".")
            }
            bool_AC = true
            
            
 //
        case "+/-":
            if ResultLabel.text != "0" {
                if ResultLabel.text?.first != "-" {
                    ResultLabel.text = "-\(ResultLabel.text!)"
                }else {
                    ResultLabel.text?.removeFirst()
                }
                bool_AC = true
            }
           
            
            
 //
        case "->" :
            switch ResultLabel.text {
            case "1","2","3","4","5","6","7","8","9","0","-1","-2","-3","-4","-5","-6","-7","-8","-9","-0","-0.":
                ResultLabel.text = "0"
            default:
                ResultLabel.text?.removeLast()

            }
           
            
            
//
        case "%":
           if ResultLabel.text != "0" {
                ResultLabel.text = "\((Float(ResultLabel.text!)!) / 100.0)"
            
            if ResultLabel.text == "0.0" { ResultLabel.text = "0"}
               
            bool_AC = true
                    }
         
            
            
//
        case "+" :
            if !boolAmal2
            {
            S1 = Double(ResultLabel.text!) ?? Double(Remoove(ResultLabel.text!))!
            boolAmal2 = true
            }
            boolAmal = true
            amal = "+"
            boolequal = true
            
            
//
        case "-":
            if !boolAmal {
            S1 = Double(ResultLabel.text!) ?? Double(Remoove(ResultLabel.text!))!
            boolAmal = true
            }
            amal = "-"
            boolequal = true
            
//
        case "x":
            if !boolAmal {
            S1 = Double(ResultLabel.text!) ?? Double(Remoove(ResultLabel.text!))!
            boolAmal = true
            }
            amal = "x"
            boolequal = true
            
//
        case "/":
            if !boolAmal {
            S1 = Double(ResultLabel.text!) ?? Double(Remoove(ResultLabel.text!))!
            boolAmal = true
            }
            amal = "/"
            boolequal = true
            
            
//
        case "=":
            if boolequal {
            S2 = Double(ResultLabel.text!) ?? Double(Remoove(ResultLabel.text!))!
          }
            boolAmal = true
            boolAmal2 = true
           
            Amal(S1, S2, amal: amal)
            
            
//
        default:
            break
        }
        
        
        
        if bool_AC {
            ACButtonoutlet.setTitle("C", for: .normal)
        }
        
       // boolError = true
    }
    
}
