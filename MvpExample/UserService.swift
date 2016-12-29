//
//  UserService.swift
//  MvpExample
//
//  Created by Grigory Rylov on 30.11.16.
//  Copyright © 2016 Grigory Rylov. All rights reserved.
//

import Foundation

class UserService: UserServiceProtocol{
    let authUrl = URL(string: "https://grishberg.pythonanywhere.com/api/upc1/authorization")!
    
    var sessionRepository: SessionRepositoryProtocol
    
    init(sessionRepository: SessionRepositoryProtocol) {
        self.sessionRepository = sessionRepository
    }
    
    // Авторизация
    func auth(login: String, password: String, callback:@escaping (Bool) -> Void ){
        //настройка параметров запроса
        var request = URLRequest(url : authUrl)
        let postString = "ean=\(login)&password=\(password)";
        request.httpBody = postString.data(using: String.Encoding.utf8);

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
            self.proccessResponse(data: data)
        }
        // стартуем запрос
        task.resume()
    }
    
    // загрузка статуса подсветки
    func requestLightStatus(callback:@escaping (Bool) -> Void ){
    }
    
    func getUsers(callback:@escaping ([User]) -> Void ){
        let users = [   User(id: 1, name: "Iyad"),
                          User(id: 2, name: "Mila"),
                          User(id: 3, name: "Mark")
        ]
        
        let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            callback(users)
        }
    }
    
    private func proccessResponse(data: Data?){
        print("***** proccessResponse")
        //Let's convert response sent from a server side script to a NSDictionary object:
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
            
            if let parseJSON = json {
                // Now we can access value of First Name by its key
                let firstNameValue = parseJSON["success"] as? String
                print("success: \(firstNameValue)")
            }
        } catch {
            print(error)
        }

    }
}
