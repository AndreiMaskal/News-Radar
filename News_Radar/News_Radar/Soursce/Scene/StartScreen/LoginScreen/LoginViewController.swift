//
//  LoginViewController.swift
//  News_Radar
//
//  Created by Andrei Maskal on 03/11/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: Font.hiragino,
                          size:MetricText.titleLabelFontSize)
        label.font = font
        label.text = MetricText.titleLabel
        label.textColor = Color.black.color
        return label
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.text = MetricText.loginTextField
        textField.borderStyle = .bezel
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.text = MetricText.passwordTextField
        textField.borderStyle = .bezel
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(MetricText.loginTextField, for: .normal)
        button.layer.cornerRadius = 6
        let font = UIFont(name: Font.hiragino,
                          size: 20)
        button.titleLabel?.font = font
        button.setTitleColor(Color.black.color, for: .normal)
        button.addTarget(self, action: #selector(actionLogin), for: .touchUpInside)
        button.backgroundColor = Color.grey.color
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLoyaut()
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        view.backgroundColor = Color.blue.color
    }
    
    private func setupHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    private func setupLoyaut() {
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(Metric.titleLabelLeading)
            make.top.equalTo(Metric.titleLabelTop)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.leading.equalTo(Metric.titleLabelLeading)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.equalTo(Metric.titleLabelLeading)
            make.top.equalTo(loginTextField.snp.bottom).offset(20)
        }
        
        loginButton.snp.makeConstraints { make in
            make.leading.equalTo(Metric.titleLabelLeading)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
        }
    }
    
    // MARK: - Actions
    
    @objc func actionLogin() {
        navigationController?.pushViewController(MainTabBarController(),  animated: true)
    }
    
    // MARK: - Metrics
    
    enum Metric {
        static var titleLabelLeading: CGFloat = 30
        static var titleLabelTop: CGFloat = 130
    }
    
    enum MetricText {
        static var titleLabel = "GO TO..."
        static var titleLabelFontSize: CGFloat = 30
        static var loginTextField = "Login"
        static var passwordTextField = "Password"
    }
}

