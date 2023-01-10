//
//  HomeViewController.swift
//  LoginAppArquiteturas
//
//  Created by Paola Alcantara Soares on 05/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeScreen?
    var alert: Alert?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        alert = Alert.init(controller: self)
        screen?.delegate(delegate: self)
    }
    
    func validadeTextField() -> Bool {
        
        guard let emailTextField = screen?.emeailTextField.text else { return false}
        guard let senhaTextField = screen?.senhaTextField.text else { return false}
        
        if emailTextField.isEmpty && senhaTextField.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Infome seu e-mail e senha")
            return false
        } else if emailTextField.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Infome seu e-mail")
            return false
        } else if senhaTextField.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Infome sua senha")
            return false
        }
        return true
    }
}

extension HomeViewController: HomeScreenDelegate {

    func tappedRegisterButton() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tappedStartButton() {
        let viwController = CalculatorViewController()
        navigationController?.pushViewController(viwController, animated: true)
    }
    
}
