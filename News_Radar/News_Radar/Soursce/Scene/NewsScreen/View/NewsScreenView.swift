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
        addSubview(mainTableView)
    }
    
    private func setupView() {
        
    }
    
    private func setupLoyaut() {
                
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        
    }
    
    // MARK: - Actions
    
    // MARK: - Metrics
    
}
