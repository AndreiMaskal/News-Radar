//
//  SplashLaunchScreenViewController.swift
//  News_Radar
//
//  Created by Andrei Maskal on 14/11/2022.
//

import UIKit
import SnapKit
import Firebase

class SplashLaunchScreenViewController: UIViewController {
    
    // MARK: - Elements
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "News")
        imageView.image = image
        return imageView
    }()
    
    lazy var logoLabel: UILabel = {
        let logoLabel = UILabel()
        logoLabel.text = "News Radar 2022"
        let font = UIFont(name: Font.hiragino,
                          size:17)
        logoLabel.font = font
        logoLabel.textColor = Color.blue.color
        return logoLabel
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupView()
        setupLoyaut()
    }
    
    // MARK: - Private functions
    
    private func setupHierarchy() {
        view.addSubview(logoImageView)
        view.addSubview(logoLabel)
        
    }
    
    private func setupView() {
        view.backgroundColor = Color.bordo.color
    }
    
    private func setupLoyaut() {
        logoImageView.snp.makeConstraints { make in
            make.centerY.centerX.equalTo(view.safeAreaLayoutGuide)
            make.height.width.equalTo(Metric.logoImageViewHeightWidth)
        }
        
        logoLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(Metric.logoLabelBottom)
            make.width.equalTo(Metric.logoLabelWidht)
        }
    }
    
    // MARK: - Metrics
    
    enum Metric {
        static var logoImageViewHeightWidth: CGFloat = 70
        static var logoLabelBottom: CGFloat = -40
        static var logoLabelWidht: CGFloat = 170
    }
}



