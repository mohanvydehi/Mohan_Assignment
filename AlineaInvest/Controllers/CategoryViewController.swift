//
//  CategoryViewController.swift
//  AlineaInvest
//
//  Created by Mohan on 24/11/20.
//

import UIKit

class CategoryViewController: UIViewController {
    
    let viewModel: CategoryListViewModel = CategoryListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetup()
    }
}

extension CategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell else {
            return UITableViewCell()
        }
        
        let category = viewModel.categoryViewModel(at: indexPath.row)
        cell.titleLabel.text = category.title
        cell.containerView.backgroundColor = UIColor(hex: category.colorHex)
        
        if let image = UIImage(named: category.imageTitle) {
            cell.categoryImageView.image = image
        }
        
        return cell
    }
}

private extension CategoryViewController {
    
    func viewSetup() {
        
        tableViewSetup()
        viewModel.loadDummyData()
    }
    
    func tableViewSetup() {
        
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "CategoryTableViewCell")
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
