//
//  UserModel.swift
//  LoginAppArquiteturas
//
//  Created by Paola Alcantara Soares on 09/01/23.
//

import Foundation

struct UserModel: Codable { // Codable um protocolo usado para codificar e decodificar valores que vem de dados, jeson, data ...
    
    let email: String
    let senha: String
    
    init() {
        self.email = String()
        self.senha = String()
    }
    
    init(email: String, senha: String) {
        self.email = email
        self.senha = senha
    }
}
