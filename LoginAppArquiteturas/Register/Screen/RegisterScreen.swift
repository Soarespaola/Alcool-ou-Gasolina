//
//  RegisterScreen.swift
//  LoginAppArquiteturas
//
//  Created by Paola Alcantara Soares on 09/01/23.
//

import UIKit

protocol RegisterScreenDelegate: AnyObject {
    func tappedBackButton()
    func tappedResgisterButton()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenDelegate?
    public func delegate(delegate: RegisterScreenDelegate?) {
        self.delegate = delegate
    }
    
    //MARK: COMPONENTES REGISTER
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "BG BLUR")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "E-mail:"
        return label
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
    
    lazy var senhaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Senha:"
        return label
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
    
    lazy var ConfirmLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Confirme sua senha:"
        return label
    }()
    
    lazy var confirmTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.placeholder = "Confirme sua senha"
        tf.textColor = .darkGray
        tf.addDoneButtonOnKeyboard()
        return tf
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Botão Back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedResgisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedResgisterButton() {
        delegate?.tappedResgisterButton()
    }
    
    @objc func tappedBackButton() {
        delegate?.tappedBackButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundImageView)
        addSubview(backButton)
        addSubview(emailLabel)
        addSubview(emeailTextField)
        addSubview(senhaLabel)
        addSubview(senhaTextField)
        addSubview(ConfirmLabel)
        addSubview(confirmTextField)
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
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            emailLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            emeailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emeailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emeailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emeailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            senhaLabel.topAnchor.constraint(equalTo: emeailTextField.bottomAnchor, constant: 16),
            senhaLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            senhaTextField.topAnchor.constraint(equalTo: senhaLabel.bottomAnchor, constant: 10),
            senhaTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            senhaTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            senhaTextField.heightAnchor.constraint(equalToConstant: 44),
            
            ConfirmLabel.topAnchor.constraint(equalTo: senhaTextField.bottomAnchor, constant: 16),
            ConfirmLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            confirmTextField.topAnchor.constraint(equalTo: ConfirmLabel.bottomAnchor, constant: 10),
            confirmTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            confirmTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            confirmTextField.heightAnchor.constraint(equalToConstant: 44),
            
            registerButton.topAnchor.constraint(equalTo: confirmTextField.bottomAnchor, constant: 250),
            registerButton.leadingAnchor.constraint(equalTo: emeailTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emeailTextField.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

}
