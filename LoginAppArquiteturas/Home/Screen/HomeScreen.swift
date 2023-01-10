//
//  HomeScreen.swift
//  LoginAppArquiteturas
//
//  Created by Paola Alcantara Soares on 05/01/23.
//

import UIKit

protocol HomeScreenDelegate: AnyObject {
    func tappedStartButton()
    func tappedRegisterButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenDelegate?
    
    public func delegate(delegate: HomeScreenDelegate?) {
        self.delegate = delegate
    }
    
    //MARK: COMPONENTES HOME
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "BG HOME")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LOGO")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emeailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "Insira seu e-mail"
        tf.textColor = .darkGray
        tf.addDoneButtonOnKeyboard()
        return tf
    }()
    
    lazy var senhaTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.placeholder = "Insira sua senha"
        tf.textColor = .darkGray
        tf.addDoneButtonOnKeyboard()
        return tf
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedStartButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedStartButton() {
        delegate?.tappedStartButton()
    }
    
    @objc func tappedRegisterButton() {
        delegate?.tappedRegisterButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundImageView)
        addSubview(logoAppImageView)
        addSubview(emeailTextField)
        addSubview(senhaTextField)
        addSubview(startButton)
        addSubview(registerButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            logoAppImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoAppImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            emeailTextField.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 70),
            emeailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emeailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emeailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            senhaTextField.topAnchor.constraint(equalTo: emeailTextField.bottomAnchor, constant: 16),
            senhaTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            senhaTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            senhaTextField.heightAnchor.constraint(equalToConstant: 44),
            
            startButton.topAnchor.constraint(equalTo: senhaTextField.bottomAnchor, constant: 150),
            startButton.leadingAnchor.constraint(equalTo: emeailTextField.leadingAnchor),
            startButton.trailingAnchor.constraint(equalTo: emeailTextField.trailingAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 44),

            registerButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 16),
            registerButton.leadingAnchor.constraint(equalTo: emeailTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emeailTextField.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
}
