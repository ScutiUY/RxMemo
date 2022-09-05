//
//  MemoListTableViewCell.swift
//  RxMemo
//
//  Created by 신의연 on 2022/08/29.
//

import UIKit

class MemoListTableViewCell: UITableViewCell {

    private var memoTitleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "sample"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "cell")
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setLayout()
    }
    

    func setLayout() {
        contentView.addSubview(memoTitleLabel)
        
        NSLayoutConstraint.activate([
            memoTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            memoTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        ])
    }
    
    func fetchData(labelTitle: String) {
        self.memoTitleLabel.text = labelTitle
    }
    
}
