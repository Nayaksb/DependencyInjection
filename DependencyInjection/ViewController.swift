//
//  ViewController.swift
//  DependencyInjection
//
//  Created by Nayak on 20/07/20.
//  Copyright © 2020 Nayak. All rights reserved.
//

import UIKit

//Mark: API end point

let endPoint = "https://restcountries.eu/rest/v2/name/India"
    
class ViewController: UIViewController {
    
    @IBOutlet weak var lblType: UILabel!
    
    @IBOutlet weak var lblJson: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Lets get country details
        
        let country = CallCountry(_client: EndpointClient())
        // initialized object with EndpointClient object
        country.getCountryDetails() // called details method
    }

//    func onDataReady(response: Any) {
//        lblJson.text = response as? String
//    }
    
    @IBAction func clieckedProperty(_ sender: UIButton) {
        lblType.text = "Property type DI"
//        let country = CallCountry() // initialized object
               
//        country.getCountryDetails() // called details method
    }
    
    @IBAction func clickedInitializer(_ sender: UIButton) {
        lblType.text = "Initializer type DI"

//        let country = CallCountry() // initialized object
               
//        country.getCountryDetails() // called details method
    }
    
    @IBAction func clickedMethos(_ sender: UIButton) {
        lblType.text = "Method type DI"

//        let country = CallCountry() // initialized object
               
//        country.getCountryDetails() // called details method
    }
}
//Mark: Without DI
//Mark: Endpoint Client Defination Class

class EndpointClient{
    func getCountryData(url: URL, completionHandler:@escaping (_ data: Data?) -> Void){
        URLSession.shared.dataTask(with: url){ (dataResponse, urlResponse, error) in
            completionHandler(dataResponse)
            
        }.resume()
    }
}

class CallCountry{
    
    var client : EndpointClient? = nil
    
    /*
     Added Constructor with dependency value as argument
     */
    init(_client : EndpointClient){
        client = _client
    }
    func getCountryDetails() {
       
        client?.getCountryData(url: URL(string: endPoint)!){(responseData) in
            if responseData?.count != 0 {
                //process the response data
                print("Country Data \(String(describing: responseData?.count))")
                
            }
            
        }
        
    }
}
