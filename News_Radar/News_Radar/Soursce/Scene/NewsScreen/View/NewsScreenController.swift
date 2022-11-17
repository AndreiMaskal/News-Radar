//
//  NewsScreenController.swift
//  News_Radar
//
//  Created by Andrei Maskal on 01/11/2022.
//

import UIKit

class NewsScreenController: UIViewController {
    
    // MARK: - Elements
    
    private var model: [MainShortInformation] = []
    
    private var newsScreenView: NewsScreenView? {
        guard isViewLoaded else { return nil }
        return view as? NewsScreenView
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = NewsScreenView()
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
        newsScreenView?.mainTableView.delegate = self
        newsScreenView?.mainTableView.dataSource = self
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupHierarchy() {
        
    }
    
    private func setupLoyaut() {
        
    }
    
    // MARK: - Actions
    
    // MARK: - Functions
    
    
    // MARK: - Metrics
    
}

extension NewsScreenController: UITableViewDelegate {
    
}

extension NewsScreenController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
//        let model = model[indexPath.row]
//
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsScreenTableViewCell.identification) as? NewsScreenTableViewCell else { return UITableViewCell() }
//
        return cell
    }
    
    
}
