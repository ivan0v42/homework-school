//
//  ViewController.swift
//  school
//
//  Created by Ivan0v42 on 21.11.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import Alamofire


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
        login()
        
    
    }

    // MARK: - User Actions
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
    //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func login(){

        guard let url =  URL(string: "https://gdemost.handh.ru/api/v1/bridges/?format=json") else{
            return
        }
        
        let request = AF.request(url)
        
        request.responseDecodable { (result: DataResponse<ObjectResponse, AFError>) in
            if let value = result.value {
                do{
                let archiveData = try? NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: true)
                } catch {print("error\(error)")}
                    print(value)
            } else {
                //print(result.error?.localizedDescription ?? "")
            }
            
        }
        
        //let ud = UserDefaults.standard
        //ud.set  хранилище не безопасное
        
        
        
        
        let queque = DispatchQueue.global(qos: .background)
        queque.async {
           sleep(5)
            print("10")
            sleep(10)
            print("20")
            DispatchQueue.main.async {
             print("Complete")
            }
        }
        
//        request.responseJSON{ response in
//
//        print(response)
//    }
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




