//
//  NewsScreenAsembler.swift
//  News_Radar
//
//  Created by Andrei Maskal on 01/11/2022.
//

import UIKit

class NewsScreenAsembler {
    static func assembly() -> UIViewController {
        
        let newsViewController = NewsScreenController()
        let presenter = Presenter(view: newsViewController)
        newsViewController.presenter = presenter
        return newsViewController
    }
}
