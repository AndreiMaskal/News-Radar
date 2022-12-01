//
//  NewsScreenPresenter.swift
//  News_Radar
//
//  Created by Andrei Maskal on 01/11/2022.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    
    func getInfo(index: IndexPath)
    func getCountRows()
}

final class Presenter: MainViewPresenterProtocol {

    private weak var view: MainViewProtocol?
    private var info = MainShortInformation.model
    
    init(view: MainViewProtocol) {
        self.view = view
    
    }
    
    func getInfo(index: IndexPath) {
        let country = info[index.row].contry
        let shortInfo = info[index.row].shortInfo
        view?.setInfo(contry: country ?? "", shortInfo: shortInfo ?? "")
    }
    
    func getCountRows() {
        let count = info.count
        view?.setRows(count: count)
    }
}
