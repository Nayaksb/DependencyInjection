//
//  ViewController.swift
//  DependencyInjection
//
//  Created by Nayak on 20/07/20.
//  Copyright © 2020 Nayak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Lets get country details
        
        let country = CallCountry() // initialized object
        
        country.getCountryDetails() // called details method
    }


}
//Mark: API end point

let endPoint = "https://restcountries.eu/rest/v2/name/India"
    

//Mark: Endpoint Client Defination Class

class EndpointClient{
    func getCountryData(url: URL, completionHandler:@escaping (_ data: Data?) -> Void){
        URLSession.shared.dataTask(with: url){ (dataResponse, urlResponse, error) in
            completionHandler(dataResponse)
            
        }.resume()
    }
}

class CallCountry{
    func getCountryDetails(){
        let clinet: EndpointClient = EndpointClient()
        
        clinet.getCountryData(url: URL(string: endPoint)!){(responseData) in
            if responseData?.count != 0 {
                //process the response data
                print("Country Data \(String(describing: responseData?.count))")
            }
            
        }
    }
}
