//
//  NewsScreenView.swift
//  News_Radar
//
//  Created by Andrei Maskal on 17/11/2022.
//

import UIKit
import SnapKit

class NewsScreenView: UIView {
    
    // MARK: - Elements
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(NewsScreenTableViewCell.self, forCellReuseIdentifier: NewsScreenTableViewCell.identification)
        return tableView
    }()
    
    private lazy var searchNews: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        textField.borderStyle = .bezel
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = .pi
        let color = Color.grey.color
        textField.layer.borderColor = color.cgColor
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Corners.radiusButton
        return textField
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = Corners.radiusButton
        let font = UIFont(name: Font.hiragino,
                          size: 15)
        button.titleLabel?.font = font
        button.setTitle("SEARCH", for: .normal)
        button.setTitleColor(Color.yellow.color, for: .normal)
        button.addTarget(self, action: #selector(actionSearch), for: .touchUpInside)
        button.backgroundColor = Color.grey.color
        return button
    }()
    
    
    
    
    
    // MARK: - Lifecycle
    // MARK: - Private functions
    // MARK: - Actions
    
    @objc func actionSearch() {
        
    }
    
    // MARK: - Metrics
    
    
}
