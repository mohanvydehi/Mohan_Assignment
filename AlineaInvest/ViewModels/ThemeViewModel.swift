//
//  ThemeViewModel.swift
//  AlineaInvest
//
//  Created by Mohan on 24/11/20.
//

import Foundation
import UIKit

class ThemeListViewModel {
    var themes: [ThemeViewModel] = [ThemeViewModel]()
    
    func loadDummyData() {
        
        themes.removeAll()
        let titles = ["Diversity & Inclusion", "Bold Biotech", "Crypto Central", "She runs it"]
        
        var count = 1
        for title in titles {
            
            themes.append(ThemeViewModel(theme: Theme(title: title, themeImageTitle: "image\(count)")))
            count += 1
        }
    }
}

struct ThemeViewModel {
    let theme: Theme
}

extension ThemeViewModel {
    
    var title: String {
        return theme.title
    }
    
    var image: UIImage {
        return UIImage(named: theme.themeImageTitle)!
    }
}
