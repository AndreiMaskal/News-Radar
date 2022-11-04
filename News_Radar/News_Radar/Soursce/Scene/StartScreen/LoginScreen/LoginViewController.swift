//
//  LoginViewController.swift
//  News_Radar
//
//  Created by Andrei Maskal on 03/11/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Elements
    
    private var secureTextMode: Bool
    
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
        textField.placeholder = MetricText.loginTextField
        textField.tintColor = Color.yellow.color
        textField.borderStyle = .bezel
        textField.layer.borderWidth = .pi
        let color = Color.grey.color
        textField.layer.borderColor = color.cgColor
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Corners.radiusButton
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = MetricText.passwordTextField
        textField.borderStyle = .bezel
        textField.layer.borderWidth = .pi
        let color = Color.grey.color
        textField.layer.borderColor = color.cgColor
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Corners.radiusButton
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(MetricText.loginTextField, for: .normal)
        button.layer.cornerRadius = Corners.radiusButton
        let font = UIFont(name: Font.hiragino,
                          size: MetricText.loginButtonFontSize)
        button.titleLabel?.font = font
        button.setTitleColor(Color.yellow.color, for: .normal)
        
        button.addTarget(self, action: #selector(actionLogin), for: .touchUpInside)
        button.backgroundColor = Color.grey.color
        return button
    }()
    
    private lazy var textEntryModeSwitchButton: UIButton = {
        let button = UIButton()
        let imageNormal = UIImage(systemName: "eye.slash")
        let imageSelect = UIImage(systemName: "eye")
        button.tintColor = Color.yellow.color
        button.setImage(imageNormal, for: .normal)
        button.setImage(imageSelect, for: .selected)
        button.addTarget(self,
                         action: #selector(secureEntryModeSwitcher),
                         for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    init(secureTextMode: Bool) {
        self.secureTextMode = secureTextMode
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        passwordTextField.addSubview(textEntryModeSwitchButton)
    }
    
    private func setupLoyaut() {
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(Metric.titleLabelLeading)
            make.top.equalTo(Metric.titleLabelTop)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(Metric.textFieldTop)
            make.width.equalTo(Metric.textFieldWidth)
            make.height.equalTo(Metric.textFieldHeight)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginTextField.snp.bottom).offset(Metric.textFieldTop)
            make.width.equalTo(Metric.textFieldWidth)
            make.height.equalTo(Metric.textFieldHeight)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(Metric.loginButtonTop)
            make.width.equalTo(Metric.loginButtonWidth)
            make.height.equalTo(Metric.textFieldHeight)
        }
        
        textEntryModeSwitchButton.snp.makeConstraints { make in
            make.trailing.equalTo(passwordTextField.snp.trailing).offset(Metric.textEntryModeSwitchButtonTrailing)
            make.centerY.equalTo(passwordTextField.snp.centerY)
        }
        
    }
    
    // MARK: - Actions
    
    @objc func actionLogin() {
        navigationController?.pushViewController(MainTabBarController(), animated: true)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    @objc func secureEntryModeSwitcher() {
        
        textEntryModeSwitchButton.isSelected.toggle()

        if self.textEntryModeSwitchButton.state == .normal {
//            secureTextMode = true
        } else if self.textEntryModeSwitchButton.state == .selected {
//            secureTextMode = false
        }
    }
    
    // MARK: - Metrics
    
    enum Metric {
        static var titleLabelLeading: CGFloat = 30
        static var titleLabelTop: CGFloat = 130
        static var textFieldTop: CGFloat = 20
        static var loginButtonTop: CGFloat = 40
        static var textEntryModeSwitchButtonTrailing: CGFloat = -10
        static var textFieldWidth: CGFloat = UIScreen.main.bounds.width / 1.2
        static var textFieldHeight: CGFloat = textFieldWidth / 8
        static var loginButtonWidth: CGFloat = UIScreen.main.bounds.width / 3
    }
    
    enum MetricText {
        static var titleLabel = "GO TO..."
        static var titleLabelFontSize: CGFloat = 30
        static var loginButtonFontSize: CGFloat = 25
        static var loginTextField = "Login"
        static var passwordTextField = "Password"
    }
}

