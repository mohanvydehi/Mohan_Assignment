//
//  ExploreContainerViewController.swift
//  AlineaInvest
//
//  Created by Mohan on 23/11/20.
//

import UIKit

enum ExploreViewType: String, CaseIterable {
    case category, themes, trending
}

class ExploreContainerViewController: UIViewController {
    
    private lazy var categoryVC: CategoryViewController = {
        
        let viewController = CategoryViewController()
        add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var themesVC: ThemesViewController = {
        
        let viewController = ThemesViewController()
        add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var trendingVC: TrendingViewController = {
        
        let viewController = TrendingViewController()
        add(asChildViewController: viewController)
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetup()
    }
}

extension ExploreContainerViewController: SegmentedViewDelegate {
    
    func didSelectSegment(at index: Int, view: SegmentedView) {
        
        let viewType = ExploreViewType.allCases[index]
        
        removeChildViewControlelrs()
        switch viewType {
        case .category:
            add(asChildViewController: categoryVC)
            break
        case .themes:
            add(asChildViewController: themesVC)
            break
        case .trending:
            add(asChildViewController: trendingVC)
            break
        }
    }
}

private extension ExploreContainerViewController {
    
    func viewSetup() {
        
        self.title = "Explore"
        self.view.backgroundColor = .white
        
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50.0)
        let segmentedView = SegmentedView(frame: frame, viewModel: SegmentViewModel(segments: ExploreViewType.allCases.map({ $0.rawValue.capitalized })), delegate: self)
        self.view.addSubview(segmentedView)
    }
    
    func add(asChildViewController viewController: UIViewController) {
        
        addChild(viewController)
        view.addSubview(viewController.view)
        
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        viewController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        viewController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        viewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        viewController.didMove(toParent: self)
    }
    
    func removeChildViewControlelrs() {
        
        for childView in self.children {
            
            childView.view.removeFromSuperview()
            childView.removeFromParent()
        }
    }
    
    func updateView() {
        
    }
}
