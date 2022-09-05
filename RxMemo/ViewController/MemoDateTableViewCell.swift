//
//  MemoDateTableViewCell.swift
//  RxMemo
//
//  Created by 신의연 on 2022/09/05.
//

import UIKit

class MemoDateTableViewCell: UITableViewCell {

    private var dateLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "sample"
        label.textColor = .secondaryLabel
        label.textAlignment = .center
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
        contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        ])
    }
    
    func fetchData(labelTitle: String) {
        self.dateLabel.text = labelTitle
    }
    
}
