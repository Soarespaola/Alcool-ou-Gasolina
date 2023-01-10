//
//  RegisterViewController.swift
//  LoginAppArquiteturas
//
//  Created by Paola Alcantara Soares on 09/01/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var screen: RegisterScreen?
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }

}

extension RegisterViewController: RegisterScreenDelegate {
    func tappedResgisterButton() {
        let vc = CalculatorViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
