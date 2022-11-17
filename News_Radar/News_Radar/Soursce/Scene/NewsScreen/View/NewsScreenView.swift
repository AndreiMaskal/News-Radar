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
    
    private lazy var separatorLine: UIView = {
        let separator = UIView()
        separator.backgroundColor = .systemGray4
        return separator
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    // MARK: - Lifecycle
    
    init() {
        super.init(frame: .zero)
        setupHierarchy()
        setupView()
        setupLoyaut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private function
    
    private func setupHierarchy() {
        addSubview(stack)
        addSubview(mainTableView)
        addSubview(separatorLine)
        stack.addArrangedSubview(searchNews)
        stack.addArrangedSubview(searchButton)
    }
    
    private func setupView() {
        
    }
    
    private func setupLoyaut() {
        
        stack.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.trailing.equalTo(-20)
            make.leading.equalTo(20)
            make.height.equalTo(50)
        }
        
        separatorLine.snp.makeConstraints { make in
            make.top.equalTo(stack.snp.bottom).offset(20)
            make.trailing.equalTo(-20)
            make.leading.equalTo(20)
            make.height.equalTo(2)
        }
        
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(separatorLine.snp.bottom)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        
    }
    
    
    // MARK: - Actions
    
    @objc func actionSearch() {
        
    }
    
    // MARK: - Metrics
    
    
}
