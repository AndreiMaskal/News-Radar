//
//  ProfileScreenController.swift
//  News_Radar
//
//  Created by Andrei Maskal on 01/11/2022.
//

import UIKit
import SnapKit

class ProfileScreenController: UIViewController {
    
    // MARK: - Elements
    
    private lazy var exitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Exit", for: .normal)
        button.setTitleColor(Color.black.color, for: .normal)
        button.addTarget(self, action: #selector(exitProfile), for: .touchUpInside)
        button.backgroundColor = Color.grey.color
        return button
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupView()
        setupLoyaut()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = Color.blue.color
    }
    
    // MARK: - Private functions
    
    private func setupHierarchy() {
        view.addSubview(exitButton)
    }
    
    private func setupView() {
        
    }
    
    private func setupLoyaut() {
        exitButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    @objc func exitProfile() {
        FireBaseServices().logOut()
        navigationController?.pushViewController(LoginViewController(), animated: true)
        navigationController?.isNavigationBarHidden = true
        navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Metrics
}
