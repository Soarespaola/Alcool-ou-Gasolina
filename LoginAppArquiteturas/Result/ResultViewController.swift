//
//  ResultViewController.swift
//  LoginAppArquiteturas
//
//  Created by Paola Alcantara Soares on 08/01/23.
//

import UIKit

class ResultViewController: UIViewController {

    
    var screen: ResultScreen?
    
    override func loadView() {
        screen = ResultScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }

}

extension ResultViewController: ResultScreenDelegate {
    func tappedBackButton() {
        popViewController()
    }
    
    func tappedCalulateButton() {
        popViewController()
    }
    
    
}
