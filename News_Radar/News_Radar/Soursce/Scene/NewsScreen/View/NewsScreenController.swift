//
//  NewsScreenController.swift
//  News_Radar
//
//  Created by Andrei Maskal on 01/11/2022.
//

import UIKit

class NewsScreenController: UIViewController {
    
    // MARK: - Elements
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLoyaut()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }

    // MARK: - Private functions
    
    private func setupView() {
        view.backgroundColor = Color.blue.color
//        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupHierarchy() {
        
    }
    
    private func setupLoyaut() {
        
    }
    
    // MARK: - Actions
    
    // MARK: - Functions
    
    
    // MARK: - Metrics
    
}
