//
//  RequestHelper.swift
//  MvpExample
//
//  Created by Grigory Rylov on 05.01.17.
//  Copyright © 2017 Grigory Rylov. All rights reserved.
//

import Foundation
class RequesetHelper{
    let sessionRepository: SessionRepositoryProtocol
    let baseUrl: String
    
    init(url: String, sessionRepo:SessionRepositoryProtocol){
        baseUrl = url
        self.sessionRepository = sessionRepo
    }
    
    func makePostRequest(method: String, params: String, callback:@escaping (NSDictionary?) -> Void ) {

        var request = URLRequest(url : URL(string: "\(baseUrl)/\(method)")!)
        request.httpMethod = "POST"
        request.httpBody = params.data(using: String.Encoding.utf8);
        
        // обработчик запроса
        let task = URLSession.shared.dataTask(with: request) {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil{
                // вывод ошибки
                print("***** error=\(error)")
                return
            }
            
            // вывод результата
            print("***** response = \(response)")
            callback(self.proccessResponse(data: data))
        }
        // стартуем запрос
        task.resume()
    }
    
    func makeGetRequest(method: String, params: String, callback:@escaping (NSDictionary?) -> Void ) {
        let urlString = "\(baseUrl)/\(method)"
        print("url: \(urlString)")
        
        var request = URLRequest(url : URL(string: urlString)!)
        request.httpMethod = "GET"
        request.httpBody = params.data(using: String.Encoding.utf8);
        
        // обработчик запроса
        let task = URLSession.shared.dataTask(with: request) {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil{
                // вывод ошибки
                print("***** GET error=\(error)")
                return
            }
            
            // вывод результата
            print("***** GET response = \(response)")
            callback(self.proccessResponse(data: data))
        }
        // стартуем запрос
        task.resume()
    }
    

    private func proccessResponse(data: Data?) -> NSDictionary?{
        print("***** proccessResponse")
        //Let's convert response sent from a server side script to a NSDictionary object:
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
            return json
        } catch {
            print(error)
        }
        return nil
    }
}
