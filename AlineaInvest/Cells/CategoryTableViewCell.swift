//
//  CategoryTableViewCell.swift
//  AlineaInvest
//
//  Created by Mohan on 24/11/20.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    lazy var containerView: UIView = {
       
        let view = UIView()
        return view
    }()
    
    lazy var categoryImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Problem in loading cell")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellSetup()
    }
}

private extension CategoryTableViewCell {
    
    func cellSetup() {
        
        selectionStyle = .none
        contentView.backgroundColor = .white
        containerViewSetup()
        imageViewSetup()
        titleLabelSetup()
        dividerLabelSetup()
    }
    
    func containerViewSetup() {
        
        containerView.layer.cornerRadius = 40
        containerView.layer.masksToBounds = true
        contentView.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func imageViewSetup() {
        
        containerView.addSubview(categoryImageView)
        
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40).isActive = true
        categoryImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        categoryImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        categoryImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func titleLabelSetup() {
        
        containerView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
    }
    
    func dividerLabelSetup() {
        
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
