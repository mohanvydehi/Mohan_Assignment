//
//  ThemeCollectionViewCell.swift
//  AlineaInvest
//
//  Created by Mohan on 24/11/20.
//

import UIKit

class ThemeCollectionViewCell: UICollectionViewCell {

    lazy var containerView: UIView = {
       
        let view = UIView()
        return view
    }()
    
    lazy var themeImageView: UIImageView = {
        
        let imageView = UIImageView()
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(hex: "1e1e1e")
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Problem in loadinfg cell")
    }
}

private extension ThemeCollectionViewCell {
    
    func cellSetup() {
        
        containerViewSetup()
        imageVeiewSetup()
        titleLabelSetup()
    }
    
    func containerViewSetup() {
        
        containerView.layer.cornerRadius = 8
        containerView.layer.masksToBounds = true
        containerView.backgroundColor = UIColor(hex: "f8fafb")
        containerView.layer.borderColor = UIColor(hex: "edf0f8").cgColor
        containerView.layer.borderWidth = 1
        contentView.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    func imageVeiewSetup() {
        
        containerView.addSubview(themeImageView)
        
        themeImageView.translatesAutoresizingMaskIntoConstraints = false
        themeImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        themeImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        themeImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        themeImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func titleLabelSetup() {
        
        containerView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: themeImageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
    }
}
