//
//  CreateProfileScreenController.swift
//  News_Radar
//
//  Created by Andrei Maskal on 05/11/2022.
//

import UIKit

class CreateProfileScreenController: UIViewController {
    // MARK: - Elements
    
    private let minWidhtPassword = Metric.minWidhtPassword
    private let maxWidhtPassword = Metric.maxWidhtPassword
    
    private lazy var regex = "^?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*])[A-Zz-a\\d$@$!%*]{}$"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: Font.hiragino,
                          size:MetricText.titleLabelFontSize)
        label.font = font
        label.text = MetricText.titleLabel
        label.textColor = Color.black.color
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: Font.hiragino,
                          size: MetricText.messageLabelFontSize)
        label.font = font
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
        textField.textContentType = .password
        textField.layer.borderWidth = .pi
        let color = Color.grey.color
        textField.layer.borderColor = color.cgColor
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Corners.radiusButton
        textField.delegate = self
        return textField
    }()
    
    private lazy var createButton: UIButton = {
        let button = UIButton()
        button.setTitle(MetricText.createButtonTitle, for: .normal)
        button.layer.cornerRadius = Corners.radiusButton
        let font = UIFont(name: Font.hiragino,
                          size: MetricText.createButtonFontSize)
        button.titleLabel?.font = font
        button.setTitleColor(Color.yellow.color, for: .normal)
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
        view.addSubview(createButton)
        view.addSubview(messageLabel)
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
        
        createButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(Metric.loginButtonTop)
            make.width.equalTo(Metric.loginButtonWidth)
            make.height.equalTo(Metric.textFieldHeight)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(Metric.messageLabelTop)
        }
    }
    
    private func checkValidation(password: String) {
        guard password.count + 1 >= minWidhtPassword else {
            messageLabel.textColor = Color.red.color
            messageLabel.text = MetricText.negativMessageLabel
            return
        }
        
        if !password.matches(regex) {
            messageLabel.textColor = Color.green.color
            messageLabel.text = MetricText.positivMessageLabel
        }
        
    }
    
    // MARK: - Actions
    
    @objc func actionLogin() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    // MARK: - Metrics
    
    enum Metric {
        static var minWidhtPassword = 6
        static var maxWidhtPassword = 10
        static var titleLabelLeading: CGFloat = 30
        static var titleLabelTop: CGFloat = 130
        static var textFieldTop: CGFloat = 20
        static var loginButtonTop: CGFloat = 40
        static var textFieldWidth: CGFloat = UIScreen.main.bounds.width / 1.2
        static var textFieldHeight: CGFloat = textFieldWidth / 8
        static var loginButtonWidth: CGFloat = UIScreen.main.bounds.width / 3
        static var messageLabelTop: CGFloat = 20
    }
    
    enum MetricText {
        static var titleLabel = "Create your account"
        static var titleLabelFontSize: CGFloat = 30
        static var createButtonFontSize: CGFloat = 25
        static var loginTextField = "Login"
        static var passwordTextField = "Password"
        static var createButtonTitle = "Greate"
        static var negativMessageLabel = "Please min. \(Metric.minWidhtPassword) max. \(Metric.maxWidhtPassword) characters"
        static var positivMessageLabel = "Correct"
        static var messageLabelFontSize: CGFloat = 12
    }
}

extension CreateProfileScreenController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard  let text = textField.text,
        let rangeOfTextToReplace = Range(range, in: text) else { return false }
        let res: String
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            res = String(text[text.startIndex...end])
        } else {
            res = text
        }
        checkValidation(password: res)
        textField.text = res
        let subsStringToReplace = text[rangeOfTextToReplace]
        let count = text.count - subsStringToReplace.count + string.count
        return count <= maxWidhtPassword
    }
}

extension String {
    func matches(_ regex: String) -> Bool {
        return range(of: regex, options:  .regularExpression, range: nil, locale: nil) != nil
    }
}

