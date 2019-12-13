//
//  mostObject.swift
//  school
//
//  Created by Ivan0v42 on 10.12.2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

struct ObjectResponse: Codable, Hashable{
    let objects: [Object]
}

struct Object: Codable, Hashable {
    //struct Object:Decodable, Encodable {
   let id:Int
   let lat:Double
   let lng:Double
   let name:String
   let description:String
   let nameEng: String
   let photoOpen: String
   let `public` : Bool

}

extension Object {
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case lat
        case description
        case lng
        case nameEng = "name_eng"
        case photoOpen = "photo_open"
        case `public`
    }
}
