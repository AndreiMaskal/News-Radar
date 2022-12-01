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
    
    private lazy var infoImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "images")
        imageView.image = image
        
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: NewsScreenTableViewCell.identification)
        
        contentView.addSubview(cardNameLabel)
        contentView.addSubview(cardTypeLabel)
        contentView.addSubview(infoImageView)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cardTypeLabel.text = nil
        cardNameLabel.text = nil
        infoImageView.image = nil
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
        
        infoImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(5)
            make.right.equalTo(contentView.snp.right).offset(-17)
            make.bottom.equalTo(contentView.snp.bottom).offset(-5)
            make.height.width.equalTo(50)
        }
    }
    
    func configure(with country: String, shortInfo: String, imageInfo: String) {
        cardNameLabel.text = country
        cardTypeLabel.text = shortInfo
        let image = UIImage(named: imageInfo)
        infoImageView.image = image
    }

}
