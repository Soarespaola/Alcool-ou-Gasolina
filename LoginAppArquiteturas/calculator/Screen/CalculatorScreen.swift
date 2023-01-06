//
//  CalculatorScreen.swift
//  LoginAppArquiteturas
//
//  Created by Paola Alcantara Soares on 06/01/23.
//

import UIKit

protocol CalculatorScreenDelegate: AnyObject {
    func tappedCalculateButton()
    func tappedBackButton()
}

class CalculatorScreen: UIView {
    
    private weak var delegate: CalculatorScreenDelegate?
    
    public func delegate(delegate: CalculatorScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var backgroundCalculator: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG BLUR DARK")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var logoApp: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LOGO menor")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var ethanolPrice: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "Preço do Álcool"
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var gasPrice: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "Preço da Gasolina"
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedCalulateButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedCalulateButton() {
        delegate?.tappedCalculateButton()
    }
    
    @objc func tappedBackButton() {
        delegate?.tappedBackButton()
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Botão Back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundCalculator)
        addSubview(backButton)
        addSubview(logoApp)
        addSubview(ethanolPrice)
        addSubview(gasPrice)
        addSubview(calculateButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundCalculator.topAnchor.constraint(equalTo: topAnchor),
            backgroundCalculator.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundCalculator.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundCalculator.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            logoApp.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            logoApp.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoApp.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            ethanolPrice.bottomAnchor.constraint(equalTo: logoApp.bottomAnchor, constant: 134),
            ethanolPrice.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ethanolPrice.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ethanolPrice.heightAnchor.constraint(equalToConstant: 45),
            
            gasPrice.topAnchor.constraint(equalTo: ethanolPrice.bottomAnchor, constant: 16),
            gasPrice.leadingAnchor.constraint(equalTo: ethanolPrice.leadingAnchor),
            gasPrice.trailingAnchor.constraint(equalTo: ethanolPrice.trailingAnchor),
            gasPrice.heightAnchor.constraint(equalTo: ethanolPrice.heightAnchor),
            
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -135),
            calculateButton.leadingAnchor.constraint(equalTo: ethanolPrice.leadingAnchor, constant: 60),
            calculateButton.trailingAnchor.constraint(equalTo: ethanolPrice.trailingAnchor, constant: -60),
            calculateButton.heightAnchor.constraint(equalToConstant: 44)
            
            
            ])
        
            }
            
}
