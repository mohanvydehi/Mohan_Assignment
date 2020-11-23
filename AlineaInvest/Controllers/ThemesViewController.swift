//
//  ThemesViewController.swift
//  AlineaInvest
//
//  Created by Mohan on 24/11/20.
//

import UIKit

class ThemesViewController: UIViewController {

    var viewModel: ThemeListViewModel = ThemeListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSetup()
    }
}

extension ThemesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.themes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThemeCollectionViewCell", for: indexPath) as? ThemeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let theme = viewModel.themes[indexPath.row]
        cell.titleLabel.text = theme.title
        cell.themeImageView.image = theme.image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width / 2
        return CGSize(width: width, height: 180)
    }
}

private extension ThemesViewController {
    
    func viewSetup() {
        
        view.backgroundColor = .white
        viewModel.loadDummyData()
        collectionViewSetup()
    }
    
    func collectionViewSetup() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(ThemeCollectionViewCell.self, forCellWithReuseIdentifier: "ThemeCollectionViewCell")
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
