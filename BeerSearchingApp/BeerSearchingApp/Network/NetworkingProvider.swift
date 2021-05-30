//
//  NetworkingProvider.swift
//  BeerSearchingApp
//
//  Created by Juan Fernández Otero on 29/5/21.
//

import Foundation
import Alamofire

final class NetworkingProvider{

    static let shared = NetworkingProvider()
    
    private let base_url = "https://api.punkapi.com/v2/"
    private let status_ok = 200...299
    private let ibu_param = "ibu_gt="
    
    func getBeerByName(name :String,completion: @escaping(Array<Beer>?) -> () ){
        

        if(name == ""){
            completion(nil)
            return
        }
            
        
        let name = name.replacingOccurrences(of: " ", with: "_")
        var url = "\(base_url)beers?food=\(name)"
        
        //Check if the filter is active
        let isFilterBitternessActive = SharedPreferences.shared.readFilterBitternessBool()
        
        //If is active add the filter to url get 
        if(isFilterBitternessActive){
            let bitternessValue = SharedPreferences.shared.readBitternessValue()
            url += "&\(ibu_param)\(bitternessValue)"
        }
        
        
        print(url)
        
        AF.request(url,method: .get).validate(statusCode: status_ok).responseDecodable(of: Array<Beer>.self ){
            response in
         
            
            if let listBeer = response.value {
                completion(listBeer)
            }
            else{
                print(response.error?.errorDescription ?? "Error without description")
                completion(nil)
                
            }
            
        }
        
    }
}
