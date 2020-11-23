//
//  TrendingViewController.swift
//  AlineaInvest
//
//  Created by Mohan on 24/11/20.
//

import UIKit

class TrendingViewController: UIViewController {

    var viewModel: TrendListViewModel = TrendListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSetup()
    }
}

extension TrendingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? viewModel.topGainers.count : viewModel.topSellers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TrendTableViewCell", for: indexPath) as? TrendTableViewCell else {
            return UITableViewCell()
        }
        
        let trend = indexPath.section == 0 ? viewModel.topGainers[indexPath.row] : viewModel.topSellers[indexPath.row]
        cell.titleLabel.text = trend.title
        cell.codeLabel.text = trend.code
        cell.valueLabel.text = trend.value
        cell.trendImageView.image = trend.trendImage
        cell.valueLabel.backgroundColor = trend.valueBackgroundColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableHeaderView") as? TableHeaderView else {
            return nil
        }
        
        view.titleLabel.text = section == 0 ? "Top Gainers" : "Top Sellers"
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65
    }
}

private extension TrendingViewController {
    
    func viewSetup() {
 
        view.backgroundColor = .white
        viewModel.loadDummyData()
        tableViewSetup()
    }
    
    func tableViewSetup() {
        
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(TrendTableViewCell.self, forCellReuseIdentifier: "TrendTableViewCell")
        tableView.register(TableHeaderView.self, forHeaderFooterViewReuseIdentifier: "TableHeaderView")
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
