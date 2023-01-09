//
//  CalculatorViewController.swift
//  LoginAppArquiteturas
//
//  Created by Paola Alcantara Soares on 06/01/23.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var screen: CalculatorScreen?
    var alert: Alert?
    
    override func loadView() {
        screen = CalculatorScreen()
        view = screen
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert = Alert.init(controller: self)
        screen?.delegate(delegate: self)
    }
    
    func validadeTextField() -> Bool {
        
        guard let ethanoPrice = screen?.ethanolPrice.text else { return false}
        guard let gasPrice = screen?.gasPrice.text else { return false}
        
        if ethanoPrice.isEmpty && gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Infome os valores de Ácool e Gasolina")
            return false
        } else if ethanoPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Infome o valore de Ácool")
            return false
        } else if gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Infome o valore de Gasolina")
            return false
        }
        return true
    }
}

extension CalculatorViewController: CalculatorScreenDelegate {
    func tappedCalculateButton() {
        let vc = ResultViewController()
        navigationController?.pushViewController(vc, animated: true)


        
//        if validadeTextField() {
//            
//            let formatter = NumberFormatter()
//            formatter.numberStyle = .decimal
//            
//            let ethanolPrice: Double = (formatter.number(from: screen?.ethanolPrice.text ?? "0.0") as? Double) ?? 0.0
//            let gasPrice: Double = (formatter.number(from: screen?.gasPrice.text ?? "0.0") as? Double) ?? 0.0
//            
//            
//            if ethanolPrice / gasPrice > 0.7 {
//                print("Melhor utilizar Gasolina")
//            } else {
//                print("Melhor utilizar Ácool")
//            }
//        }
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
        
    }
    
}

