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
    
    private lazy var cardNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.numberOfLines = 1
        return label
    }()

    private lazy var cardTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: NewsScreenTableViewCell.identification)
        
        contentView.addSubview(cardNameLabel)
        contentView.addSubview(cardTypeLabel)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cardTypeLabel.text = nil
        cardNameLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        cardNameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(15)
            make.left.equalTo(contentView.snp.left).offset(17)
        }

        cardTypeLabel.snp.makeConstraints { make in
            make.top.equalTo(cardNameLabel.snp.bottom).offset(10)
            make.left.equalTo(cardNameLabel.snp.left)
        }
    }
    
    func configure(with model: MainShortInformation?) {
        cardNameLabel.text = model?.contry
        cardTypeLabel.text = model?.shortInfo
    }

}
