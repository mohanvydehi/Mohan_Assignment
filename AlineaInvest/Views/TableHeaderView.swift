//
//  TableHeaderView.swift
//  AlineaInvest
//
//  Created by Mohan on 24/11/20.
//

import UIKit

class TableHeaderView: UITableViewHeaderFooterView {
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        viewSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TableHeaderView {
    
    func viewSetup() {
        
        contentView.backgroundColor = .white
        titleLabelSetup()
    }
    
    func titleLabelSetup() {
        
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
    }
}
