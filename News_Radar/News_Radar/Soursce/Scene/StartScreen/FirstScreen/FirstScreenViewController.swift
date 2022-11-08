//
//  FirstScreenViewController.swift
//  News_Radar
//
//  Created by Andrei Maskal on 03/11/2022.
//

import UIKit
import SnapKit
import Firebase

class FirstScreenViewController: UIViewController {
    
    // MARK: - Elements
    
    private lazy var newsImageView:  UIImageView = {
        let imageView = UIImageView(frame: .infinite)
        let image = UIImage(named: MetricText.newsImageView)
        imageView.image = image
        return imageView
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
    
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.text = MetricText.bottomLabel
        let font = UIFont(name: Font.hiragino,
                          size:MetricText.bottomLabelFontSize)
        label.font = font
        label.textColor = Color.grey.color
        return label
    }()
    
    private lazy var openButton: UIButton = {
        let button = UIButton()
        button.setTitle(MetricText.openButton, for: .normal)
        button.layer.cornerRadius = Corners.radiusButton
        let font = UIFont(name: Font.hiragino,
                          size: 20)
        button.titleLabel?.font = font
        button.setTitleColor(Color.yellow.color, for: .normal)
        button.addTarget(self, action: #selector(setScreenLogin), for: .touchUpInside)
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
        view.addSubview(newsImageView)
        newsImageView.addSubview(logoLabel)
        view.addSubview(mainCaptionLabel)
        view.addSubview(openButton)
        view.addSubview(bottomLabel)
    }
    
    private func setupLoyaut() {
        
        newsImageView.snp.makeConstraints { make in
            make.width.equalTo(Metric.newsImageViewSize)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(Metric.newsImageViewTop)
        }
        
        logoLabel.snp.makeConstraints { make in
            make.centerY.equalTo(newsImageView.snp.centerY).offset(Metric.mainNameLabelTop)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        mainCaptionLabel.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).offset(Metric.mainCaptionLabelTop)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        openButton.snp.makeConstraints { make in
            make.top.equalTo(mainCaptionLabel.snp.bottom).offset(Metric.openButtonTop)
            make.width.equalTo(Metric.openButtonWight)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        bottomLabel.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(Metric.bottomLabelBottom)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    // MARK: - Actions
    
//    @objc func setScreenLogin() {
//
//        Auth.auth().addStateDidChangeListener { auth, user in
//            if user == nil {
//                self.navigationController?.pushViewController(LoginViewController(), animated: true)
//                self.navigationController?.navigationBar.tintColor = Color.grey.color
//            } else {
//                self.navigationController?.pushViewController(MainTabBarController(), animated: true)
//                self.navigationController?.isNavigationBarHidden = true
//            }
//        }
//    }
    
    @objc func setScreenLogin() {
    
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
        self.navigationController?.navigationBar.tintColor = Color.grey.color
    }
        
    // MARK: - Metrics
    
    enum Metric {
        static var newsImageViewSize: CGFloat = UIScreen.main.bounds.width / 0.8
        static var newsImageViewTop: CGFloat = 0
        static var mainNameLabelTop: CGFloat = 120
        static var mainCaptionLabelTop: CGFloat = 30
        static var openButtonTop: CGFloat = 130
        static var createAccountButtonTop: CGFloat = 20
        static var openButtonWight: CGFloat = 150
        static var bottomLabelBottom: CGFloat = -20
    }
    
    enum MetricText {
        static var newsImageView = "cubes-letters"
        static var logoLabel = "RADAR"
        static var logoLabelFontSize: CGFloat = 60
        static var mainCaptionLabel = "only fresh"
        static var mainCaptionLabelFontSize: CGFloat = 20
        static var openButton = "Continue"
        static var bottomLabel = "2022"
        static var bottomLabelFontSize: CGFloat = 10
    }
}


