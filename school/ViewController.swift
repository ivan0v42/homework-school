//
//  ViewController.swift
//  school
//
//  Created by Ivan0v42 on 21.11.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
     //MARK: Properties
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        loginTextField.keyboardType = UIKeyboardType.emailAddress
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    // MARK: - User Actions
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
    //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func login(){
    }
    
    @IBAction func endEditing (sender:UITextField){
        if loginTextField === sender
        {
            print("Login:\(String(describing: sender.text))")
            passTextField.becomeFirstResponder()
        }
        else
        {
            print("Password:\(String(describing: sender.text))")
            sender.resignFirstResponder()
        }
    }
    
    @IBAction func tap (sender:UITapGestureRecognizer){
      // print("tap")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProfileViewController"{
            
            (segue.destination as! ProfileViewController).dataLogin = loginTextField.text
            (segue.destination as! ProfileViewController).dataPass = passTextField.text
            
            //print ("Go Go")
        }
    }

    }




