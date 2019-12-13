//
//  AlamofireTestViewController.swift
//  school
//
//  Created by Ivan0v42 on 12.12.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class AlamofireTestViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableViewCell: UITableView?
    var objects: ObjectResponse?
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        guard let url =  URL(string: "https://gdemost.handh.ru/api/v1/bridges/?format=json") else{
                  return
              }
        let quequeDataLoad = DispatchQueue.global(qos: .utility)
            
            quequeDataLoad.async {
                        
        let request = AF.request(url)
        
            request.responseDecodable { (result: DataResponse<ObjectResponse, AFError>) in
          
                if result.value != nil {
                              do {
                                let decoder = JSONDecoder()
                                let model:ObjectResponse = try decoder.decode(ObjectResponse.self, from: result.data!)
                                self.objects=model
                                self.tableViewCell?.reloadData()
                              } catch {print("error\(error)")}
                    print(self.objects as Any)
                          } else {
                              print(result.error?.localizedDescription ?? "")
                          }
                }
          }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return objects?.objects.count ?? 0
      
    }
      
    
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "AlamofireTest", for: indexPath) as! AlamofireTestCell
    
        let eachObj = objects?.objects[indexPath.row]
        
        cell.lblName?.text=eachObj?.name
        
        cell.lblDescription?.text=eachObj?.description

        let imageURL = "https://gdemost.handh.ru/"+(eachObj?.photoOpen ?? "")
        
        let url = URL(string: imageURL)
        
        let quequeImageLoad = DispatchQueue.global(qos: .utility)

        quequeImageLoad.async {

            cell.imageObject?.kf.setImage(with: url)
        
        }
        
        return cell
    
    }
}
