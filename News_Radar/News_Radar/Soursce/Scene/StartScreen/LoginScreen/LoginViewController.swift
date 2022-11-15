//
//  LoginViewController.swift
//  News_Radar
//
//  Created by Andrei Maskal on 03/11/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Elements
    
     let minWidhtPassword = Metric.minWidhtPassword
     let maxWidhtPassword = Metric.maxWidhtPassword
    
    private lazy var regex = "^?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*])[A-Zz-a\\d$@$!%*]{}$"
    
    private lazy var newsImageView:  UIImageView = {
        let imageView = UIImageView(frame: .infinite)
        let image = UIImage(named: MetricText.newsImageView)
        imageView.image = image
        return imageView
    }()
        
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: view.bounds)
        return scrollView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: Font.hiragino,
                          size:MetricText.titleLabelFontSize)
        label.font = font
        label.text = MetricText.titleLabel
        label.textColor = Color.black.color
        return label
    }()
    
    private lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.text = MetricText.logoLabel
        let font = UIFont(name: Font.hiragino,
                          size:MetricText.logoLabelFontSize)
        label.font = font
        label.textColor = Color.black.color
        return label
    }()
    
    private lazy var mainCaptionLabel: UILabel = {
        let label = UILabel()
        label.text = MetricText.mainCaptionLabel
        let font = UIFont(name: Font.hiragino,
                          size:MetricText.mainCaptionLabelFontSize)
        label.font = font
        label.textColor = Color.grey.color
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
        textField.delegate = self
        return textField
    }()
    
    private lazy var openButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = Corners.radiusButton
        let font = UIFont(name: Font.hiragino,
                          size: MetricText.loginButtonFontSize)
        button.titleLabel?.font = font
        button.setTitle(MetricText.loginTitleButton, for: .normal)
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
        button.setTitle(MetricText.changeCreateTitButton, for: .normal)
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
    
    private var switchUp: Bool = false {
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
    
    deinit {
        removeKeyboardNotification()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLoyaut()
        registerForKeyboardNotification()
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        view.backgroundColor = Color.blue.color
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(newsImageView)
        newsImageView.addSubview(logoLabel)
        scrollView.addSubview(mainCaptionLabel)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(loginTextField)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(openButton)
        scrollView.addSubview(textEntryModeSwitchButton)
        scrollView.addSubview(messageLabel)
        scrollView.addSubview(changeButton)
    }
    
    private func setupLoyaut() {
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(-50)
            make.bottom.leading.trailing.equalTo(0)
        }
             
        newsImageView.snp.makeConstraints { make in
            newsImageView.snp.makeConstraints { make in
                make.width.equalTo(Metric.newsImageViewSize)
                make.centerX.equalTo(view.snp.centerX)
                make.top.equalTo(scrollView.snp.top).offset(Metric.newsImageViewTop)
            }
        }
        
        logoLabel.snp.makeConstraints { make in
            make.centerY.equalTo(newsImageView.snp.centerY).offset(Metric.mainNameLabelTop)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        mainCaptionLabel.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).offset(Metric.mainCaptionLabelTop)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(Metric.titleLabelLeading)
            make.top.equalTo(newsImageView.snp.bottom).offset(Metric.titleLabelTop) 
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
                FireBaseServices().createUser(email: email, password: password)
            } else {
                showAlert(message: MetricText.messageErrorFields)
            }
        } else {
            if (!email.isEmpty && !password.isEmpty) {
                FireBaseServices().signIn(email: email, password: password) { [weak self] result in
                    switch result {
                    case .success: break
                    case .failure(let error):
                        self?.showAlert(message: error.localizedDescription)
                    }
                }
            } else {
                showAlert(message: MetricText.messageErrorFields)
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
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    // MARK: - Functions
    
    func checkValidation(password: String) {
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
    
    // MARK: - Metrics
    
    enum Metric {
        static var newsImageViewSize: CGFloat = UIScreen.main.bounds.width / 1.3
        static var newsImageViewTop: CGFloat = 100
        static var mainNameLabelTop: CGFloat = 120
        static var mainCaptionLabelTop: CGFloat = 30
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
        static var newsImageView = "depositphotos2"
        static var titleLabel = "Sign in"
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
        static var messageErrorFields = "All fields should be filled"
        static var logoLabel = "RADAR"
        static var logoLabelFontSize: CGFloat = 60
        static var mainCaptionLabel = "only fresh"
        static var mainCaptionLabelFontSize: CGFloat = 20
    }
}

        

