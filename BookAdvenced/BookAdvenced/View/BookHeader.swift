//
//  BookHeader.swift
//  BookAdvenced
//
//  Created by 신상규 on 8/6/24.
//

import UIKit

class BookHeader: UICollectionReusableView {
    static let id = "BookHeader"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "최근 본 책"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.adjustsFontForContentSizeCategory = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
    
}
