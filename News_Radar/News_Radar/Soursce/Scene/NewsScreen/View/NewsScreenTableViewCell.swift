//
//  NewsScreenTableViewCell.swift
//  News_Radar
//
//  Created by Andrei Maskal on 17/11/2022.
//

import UIKit
import SnapKit

class NewsScreenTableViewCell: UITableViewCell {
    
   static let identification = "NewsScreenTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: NewsScreenTableViewCell.identification)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
