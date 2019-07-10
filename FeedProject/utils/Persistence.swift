//
//  Persistence.swift
//  FeedProject
//
//  Created by Juanelo on 7/10/19.
//  Copyright © 2019 Juanelo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class Connection {
    static let URL_SITE = "http://gl-endpoint.herokuapp.com/feed" //dev
    
    static let sharedInstance=Connection()
    static let TIME_OUT=125.0
    
    var manager:SessionManager?
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = Connection.TIME_OUT
        configuration.timeoutIntervalForRequest = Connection.TIME_OUT
        manager = Alamofire.SessionManager(configuration:configuration)
    }
    
    func getPost( onSuccess:@escaping ((JSON)->Void),onError:@escaping ((Error)->Void)) {
        
        
        manager?.request("\(Connection.URL_SITE)", method: .get).responseString{response in
            //            print(response)
            switch response.result {
            case .success(let value):
                let encodedString : Data = (value.trimmingCharacters(in:.whitespaces) as NSString).data(using: String.Encoding.utf8.rawValue)!
                do{
                    let json = try! JSON(data:encodedString)
                    // json["statusCode"] = JSON("\(response.response!.statusCode)")
                    onSuccess(json)
                }
                
            case .failure(let error):
                onError(error)
            }
        }
    }
}
