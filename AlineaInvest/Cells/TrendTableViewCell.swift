//
//  TrendTableViewCell.swift
//  AlineaInvest
//
//  Created by Mohan on 24/11/20.
//

import UIKit

class TrendTableViewCell: UITableViewCell {

    lazy var trendImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        
        return label
    }()
    
    lazy var codeLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(hex: "c2c2c8")
        
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.layer.cornerRadius = 10 
        label.layer.masksToBounds = true
        
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

private extension TrendTableViewCell {
    
    func cellSetup() {
        
        imageViewSetup()
        titleLabelSetup()
        codeLabelSetup()
        valueLabelSetup()
        dividerLabelSetup()
    }
    
    func imageViewSetup() {
        
        contentView.addSubview(trendImageView)
        
        trendImageView.translatesAutoresizingMaskIntoConstraints = false
        trendImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        trendImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        trendImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        trendImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func titleLabelSetup() {
        
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: trendImageView.trailingAnchor, constant: 20).isActive = true
    }
    
    func codeLabelSetup() {
        
        contentView.addSubview(codeLabel)
        
        codeLabel.translatesAutoresizingMaskIntoConstraints = false
        codeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6).isActive = true
        codeLabel.leadingAnchor.constraint(equalTo: trendImageView.trailingAnchor, constant: 20).isActive = true
        codeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }
    
    func valueLabelSetup() {
        
        contentView.addSubview(valueLabel)
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        valueLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 12).isActive = true
        valueLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        valueLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
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
