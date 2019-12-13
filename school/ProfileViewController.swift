//
//  ProfileViewController.swift
//  school
//
//  Created by Ivan0v42 on 03.12.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource {
   
    @IBOutlet var tableView: UITableView!
    @IBOutlet var header: UIImageView!
    
    var dataLogin: String?
    var dataPass: String?
    
    var names = ["Настройки", "Условия доставки", "Рестораны", "Связаться с нами", "Оценить приложение","О приложении"]
    var images = [UIImage(named: "settings"),UIImage(named: "delivery"), UIImage(named: "restourant"),UIImage(named: "letter"),UIImage(named: "rating"),UIImage(named: "info")]
   
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.setNavigationBar()
        
        header.image = UIImage(named: "header")
        header.layoutMargins = UIEdgeInsets(top: 0, left: 64, bottom: 0, right: 0)
        header.contentMode = .scaleAspectFill
        self.tableView.rowHeight = 56
        self.tableView.backgroundColor = .black
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 6
       }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))

        let labelOne = UILabel()
        labelOne.frame = CGRect.init(x: 25, y: 0, width: headerView.frame.width-10, height: headerView.frame.height-10)
        labelOne.text = "Представьтесь"
        
        print(dataLogin)
        print(dataPass)
        
        labelOne.text = dataLogin
        labelOne.textColor = UIColor.white // my custom colour
        labelOne.font = labelOne.font.withSize(17)
        
        let labelTwo = UILabel()
        labelTwo.frame = CGRect.init(x: 25, y: 25, width: headerView.frame.width-10, height:
            headerView.frame.height-10)
        labelTwo.text = "Чтобы стать ближе, получать бонусы"
        //labelTwo.text = dataPass
        labelTwo.textColor = UIColor.gray // my custom colour
        labelTwo.font = labelTwo.font.withSize(12)
        
        headerView.addSubview(labelOne)
        headerView.addSubview(labelTwo)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(headerTap))
        headerView.addGestureRecognizer(tapRecognizer)
        
        
        return headerView
    }
    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! CustomCell
        cell.photo.image = images[indexPath.row]
        cell.name.text = names[indexPath.row]
        let view = UIView()
           view.backgroundColor = UIColor.red
           cell.backgroundColor = UIColor.black
           cell.selectedBackgroundView = view
        return cell
    
    }
    
    
//
//    func setNavigationBar() {
//        let screenSize: CGRect = UIScreen.main.bounds
//        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
//        let navItem = UINavigationItem(title: "")
//        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(done))
//        navItem.rightBarButtonItem = doneItem
//        navBar.setItems([navItem], animated: false)
//        self.view.addSubview(navBar)
//    }

    @objc func done() { // remove @objc for Swift 3

    }
    
    
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let headerView = UIView()
//
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(headerTap))
//        headerView.addGestureRecognizer(tapRecognizer)
//
//        return headerView
//    }

    @objc func headerTap() {
        
        dismiss(animated: true, completion: nil)
        //print("1")
    }
    
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
}



extension UIImage {

    func withInset(_ insets: UIEdgeInsets) -> UIImage? {
        let cgSize = CGSize(width: self.size.width + insets.left * self.scale + insets.right * self.scale,
                            height: self.size.height + insets.top * self.scale + insets.bottom * self.scale)

        UIGraphicsBeginImageContextWithOptions(cgSize, false, self.scale)
        defer { UIGraphicsEndImageContext() }

        let origin = CGPoint(x: insets.left * self.scale, y: insets.top * self.scale)
        self.draw(at: origin)

        return UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(self.renderingMode)
    }
}
