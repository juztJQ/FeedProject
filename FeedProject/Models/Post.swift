//
//  Post.swift
//  FeedProject
//
//  Created by Juanelo on 7/10/19.
//  Copyright © 2019 Juanelo. All rights reserved.
//

/*
 {
 "id": 1,
 "first_name": "Averill",
 "last_name": "Erricker",
 "post_body": "Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.",
 "unix_timestamp": "1525940534"
 },
 */

import Foundation
import SwiftyJSON
struct  Post {
    
    var id : String = ""
    var firstName : String = ""
    var lastName : String = ""
    var postBody : String = ""
    var timeStamp : String
    var date : String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = Date(timeIntervalSince1970: TimeInterval(Double(timeStamp)!))
        return dateFormatter.string(from: date)
    }
    
    
    
    init(json : JSON) {
        self.id = json["id"].stringValue
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.timeStamp = json["unix_timestamp"].stringValue
        self.postBody = json["post_body"].stringValue
    }
    
}

