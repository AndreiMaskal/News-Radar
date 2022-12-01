//
//  NewsScreenController.swift
//  News_Radar
//
//  Created by Andrei Maskal on 01/11/2022.
//

import UIKit

protocol MainViewProtocol: AnyObject {

    func setInfo(contry: String, shortInfo: String)
    func setRows(count: Int)
}


class NewsScreenController: UIViewController {
    
    // MARK: - Elements
    
    var country = String()
    var shortInfo = String()
    var countRows = Int()
    var presenter: MainViewPresenterProtocol?
    
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension NewsScreenController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getCountRows()
        return countRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsScreenTableViewCell.identification) as? NewsScreenTableViewCell else { return UITableViewCell() }
        
        presenter?.getInfo(index: indexPath)
        cell.configure(with: country, shortInfo: shortInfo)

        return cell
    }
}

extension NewsScreenController: MainViewProtocol {
    func setInfo(contry: String, shortInfo: String) {
        self.country = contry
        self.shortInfo = shortInfo
    }
    
    func setRows(count: Int) {
        self.countRows = count
    }
    
    
}
