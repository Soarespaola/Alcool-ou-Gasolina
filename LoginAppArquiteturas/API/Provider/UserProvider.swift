//
//  UserProvider.swift
//  LoginAppArquiteturas
//
//  Created by Paola Alcantara Soares on 09/01/23.
//

import Foundation
import FirebaseAuth

// Provider é quem faz a chamada/interacao com a API
// Business interage com o Provider
// Manager integare com o Business

protocol UserProviderProtocol {
    func login(paramters: [AnyHashable: Any], completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    func register(paramters: [AnyHashable: Any], completionHandler: @escaping(Result<UserModel, Error>) -> Void)
}

class UserProvider: UserProviderProtocol {
    lazy var auth = Auth.auth()
    
    func login(paramters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        let body: NSDictionary = paramters[Constants.ParametersKeys.body] as! NSDictionary
        let userModel = body[Constants.ParametersKeys.userModel] as! UserModel
        
        self.auth.signIn(withEmail: userModel.email, password: userModel.senha) {(result, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(userModel))
            }
        }
    }
    
    func register(paramters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        
        let body: NSDictionary = paramters[Constants.ParametersKeys.body] as! NSDictionary
        let userModel = body[Constants.ParametersKeys.userModel] as! UserModel
        
        self.auth.createUser(withEmail: userModel.email, password: userModel.senha) {(result, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(userModel))
            }
        }

        
    }
}
