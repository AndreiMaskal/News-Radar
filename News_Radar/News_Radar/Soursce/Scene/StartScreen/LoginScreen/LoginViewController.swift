//
//  LoginViewController.swift
//  News_Radar
//
//  Created by Andrei Maskal on 03/11/2022.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    // MARK: - Elements
    
    private let minWidhtPassword = Metric.minWidhtPassword
    private let maxWidhtPassword = Metric.maxWidhtPassword
    
    private lazy var regex = "^?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*])[A-Zz-a\\d$@$!%*]{}$"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: Font.hiragino,
                          size:MetricText.titleLabelFontSize)
        label.font = font
        label.text = MetricText.createTitleLabel
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
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = .pi
        let color = Color.grey.color
        textField.layer.borderColor = color.cgColor
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Corners.radiusButton
        textField.returnKeyType = .done
        return textField
    }()
    
    private lazy var openButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = Corners.radiusButton
        let font = UIFont(name: Font.hiragino,
                          size: MetricText.loginButtonFontSize)
        button.titleLabel?.font = font
        button.setTitle(MetricText.createTitleButton, for: .normal)
        button.setTitleColor(Color.yellow.color, for: .normal)
        button.addTarget(self, action: #selector(actionLogin), for: .touchUpInside)
        button.backgroundColor = Color.grey.color
        return button
    }()
    
    private lazy var changeButton: UIButton = {
        let button = UIButton()
        let font = UIFont(name: Font.hiragino,
                          size: 15)
        button.titleLabel?.font = font
        button.setTitleColor(Color.black.color, for: .normal)
        button.setTitle(MetricText.changeLoginTitleButton, for: .normal)
        button.addTarget(self, action: #selector(changeTitleButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var textEntryModeSwitchButton: UIButton = {
        let button = UIButton()
        let imageNormal = UIImage(systemName: "eye.slash")
        let imageSelect = UIImage(systemName: "eye")
        button.tintColor = Color.grey.color
        button.setImage(imageNormal, for: .normal)
        button.setImage(imageSelect, for: .selected)
        button.addTarget(self,
                         action: #selector(secureEntryModeSwitcher),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: Font.hiragino,
                          size: MetricText.messageLabelFontSize)
        label.font = font
        return label
    }()
    
    private var switchUp: Bool = true {
        willSet {
            if newValue {
                titleLabel.text = MetricText.createTitleLabel
                passwordTextField.text = ""
                loginTextField.text = ""
                messageLabel.text = ""
                openButton.setTitle(MetricText.createTitleButton, for: .normal)
                changeButton.setTitle(MetricText.changeLoginTitleButton, for: .normal)
            } else {
                passwordTextField.text = ""
                loginTextField.text = ""
                messageLabel.text = ""
                openButton.setTitle(MetricText.loginTitleButton, for: .normal)
                titleLabel.text = MetricText.titleLabel
                changeButton.setTitle(MetricText.changeCreateTitButton, for: .normal)
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLoyaut()
        passwordTextField.delegate = self
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        view.backgroundColor = Color.blue.color
    }
    
    private func setupHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(openButton)
        view.addSubview(textEntryModeSwitchButton)
        view.addSubview(messageLabel)
        view.addSubview(changeButton)
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
        
        openButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(Metric.loginButtonTop)
            make.width.equalTo(Metric.loginButtonWidth)
            make.height.equalTo(Metric.textFieldHeight)
        }
        
        textEntryModeSwitchButton.snp.makeConstraints { make in
            make.trailing.equalTo(passwordTextField.snp.trailing).offset(Metric.textEntryModeSwitchButtonTrailing)
            make.centerY.equalTo(passwordTextField.snp.centerY)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(Metric.messageLabelTop)
        }
        
        changeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(openButton.snp.bottom).offset(20)
        }
    }
    
    // MARK: - Actions
    
    @objc func actionLogin() {
        let email = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if(switchUp) {
            if (!email.isEmpty && !password.isEmpty) {
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if error == nil {
                        if let result = result {
                            print(result.user.uid)
                            let base = Database.database().reference().child("users")
                            base.child(result.user.uid).updateChildValues(["email" : email])
                        }
                    }
                }
            } else {
                showAlert()
            }
        } else {
            if (!email.isEmpty && !password.isEmpty) {
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if error == nil {
                    } else {
                        self.errorAlert()
                    }
                }
            } else {
                showAlert()
            }
        }
    }
    
    @objc func changeTitleButton() {
        switchUp = !switchUp
    }
    
    @objc func secureEntryModeSwitcher() {
        
        textEntryModeSwitchButton.isSelected.toggle()
        
        if textEntryModeSwitchButton.isSelected {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
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
    
    private func showAlert() {
        let alert = UIAlertController(title: "Error", message: "All fields should be filled", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    private func errorAlert() {
        let alert = UIAlertController(title: "Error", message: "There is no such user", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    // MARK: - Metrics
    
    enum Metric {
        static var minWidhtPassword = 6
        static var maxWidhtPassword = 10
        static var titleLabelLeading: CGFloat = 30
        static var titleLabelTop: CGFloat = 130
        static var textFieldTop: CGFloat = 20
        static var loginButtonTop: CGFloat = 40
        static var textEntryModeSwitchButtonTrailing: CGFloat = -10
        static var textFieldWidth: CGFloat = UIScreen.main.bounds.width / 1.2
        static var textFieldHeight: CGFloat = textFieldWidth / 8
        static var loginButtonWidth: CGFloat = UIScreen.main.bounds.width / 3
        static var messageLabelTop: CGFloat = 20
    }
    
    enum MetricText {
        static var titleLabel = "GO TO..."
        static var createTitleLabel = "Create your account"
        static var createTitleButton = "Create"
        static var changeCreateTitButton = "Registration?"
        static var changeLoginTitleButton = "I have profile"
        static var loginTitleButton = "Login"
        static var titleLabelFontSize: CGFloat = 30
        static var loginButtonFontSize: CGFloat = 25
        static var loginTextField = "Email"
        static var passwordTextField = "Password"
        static var negativMessageLabel = "Please min. \(Metric.minWidhtPassword) max. \(Metric.maxWidhtPassword) characters"
        static var positivMessageLabel = "Correct"
        static var messageLabelFontSize: CGFloat = 12
    }
}

extension LoginViewController: UITextFieldDelegate {
    
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        actionLogin()
        return true
    }
}

