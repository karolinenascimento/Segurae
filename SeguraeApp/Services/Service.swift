//
//  Service.swift
//  SeguraeApp
//
//  Created by Vinicius on 28/09/22.
//

import Foundation

class ValueAPI {
    class func valueRequest(high: String, completion: @escaping (Value) -> Void) {
        let url = URL(string: "https://economia.awesomeapi.com.br/json/last/USD-BRL")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let responseData = data else {return}
            do {
                let valueConverter = try JSONDecoder().decode(Value.self, from: responseData)
                completion(valueConverter)
                //                print("value: \(valueConverter)")
            } catch let error {
                print("error: \(error)")
            }
            if let responseString = String(data: responseData, encoding: .utf8){
                print(responseString)
            }
        }
        task.resume()
    }
}
