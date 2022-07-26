//
//  ViewController.swift
//  Calculator swift
//
//  Created by Джамал Гумасов on 23.07.2022.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
    }
    var result = 0.0
    var firstNumber = 0.0
    var operatorVariable = ""
    var WholeExpression = ""
    var isClicKEqualTo = false
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var inputTextBox: UITextField!
    func checkNilOrBlankValue() -> Bool{
        if inputTextBox.text == nil || inputTextBox.text == "" {
            return false
        }
        else {
            return true
        }
    }
    func dataCalculation(_ oper:String) {
        if operatorVariable != "" {
            errorLabel.text = "First Press EqualTo Button."
        }
            else if checkNilOrBlankValue() {
                   firstNumber = Double(inputTextBox.text!)!
                   inputTextBox.text = ""
                   operatorVariable = oper
                   WholeExpression += oper
                   errorLabel.text = WholeExpression
                   isClicKEqualTo = false
               }
               else {
                   errorLabel.text = "Invalid Syntex."
               }
    }
    func appendExpression(_ oper: String) {
        if !isClicKEqualTo {
            WholeExpression += oper
            errorLabel.text = WholeExpression
            inputTextBox.text = inputTextBox.text! + oper
        }
        else{
            errorLabel.text = "Either clear input box or put an operand."
        }
    }
    @IBAction func clearButton(_ sender: UIButton) {
        inputTextBox.text = ""
        errorLabel.text = ""
        WholeExpression = ""
        isClicKEqualTo = false
    }
    @IBAction func equalButton(_ sender: UIButton) {
        if isClicKEqualTo {
            errorLabel.text = "Equalto button is already clicked."
        }
        else{
            if operatorVariable == "+" {
                result = Double(inputTextBox.text!)! + firstNumber
                inputTextBox.text = String(format: "%.2f",result)
            }
            else if operatorVariable == "-" {
                result = firstNumber - Double(inputTextBox.text!)!
                inputTextBox.text = String(format: "%.2f",result)
            }
            else if operatorVariable == "*" {
                result = Double(inputTextBox.text!)! * firstNumber
                inputTextBox.text = String(format: "%.2f",result)
            }
            else if operatorVariable == "/" {
                if inputTextBox.text != "0" {
                    result =  firstNumber / Double(inputTextBox.text!)!
                    inputTextBox.text = String(format: "%.2f",result)
                }
                else {
                    errorLabel.text = "Divisible by zero is not allowed."
                }
            }
            isClicKEqualTo = true
            operatorVariable = ""
        }
    }
    @IBAction func divideButton(_ sender: UIButton) {
        dataCalculation("/")
    }
    @IBAction func multiplyButton(_ sender: UIButton) {
       dataCalculation("*")
    }
    @IBAction func subtrctButton(_ sender: UIButton) {
        dataCalculation("-")
    }
    @IBAction func addButton(_ sender: UIButton) {
        dataCalculation("+")
    }
    @IBAction func button0(_ sender: UIButton) {
       appendExpression("0")
    }
    @IBAction func button1(_ sender: UIButton) {
       appendExpression("1")
    }
    @IBAction func button2(_ sender: UIButton) {
        appendExpression("2")
    }
    @IBAction func button3(_ sender: UIButton) {
        appendExpression("3")
    }
    @IBAction func button4(_ sender: UIButton) {
        appendExpression("4")
    }
    @IBAction func button5(_ sender: UIButton) {
        appendExpression("5")
    }
    @IBAction func button6(_ sender: UIButton) {
        appendExpression("6")
    }
    @IBAction func button7(_ sender: UIButton) {
        appendExpression("7")
    }
    @IBAction func button8(_ sender: UIButton) {
        appendExpression("8")
    }
    @IBAction func button9(_ sender: UIButton) {
        appendExpression("9")
    }
}

