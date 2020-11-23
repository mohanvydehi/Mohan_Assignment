//
//  TrendViewModel.swift
//  AlineaInvest
//
//  Created by Mohan on 24/11/20.
//

import Foundation
import UIKit

class TrendListViewModel {
    
    var topGainers: [TrendViewModel] = [TrendViewModel]()
    var topSellers: [TrendViewModel] = [TrendViewModel]()
    
    func loadDummyData() {
        
        topGainers.removeAll()
        topSellers.removeAll()

        let trend1 = Trend(title: "Medifast", code: "MEDI", value: "+50.78", imageTitle: "medifast")
        topGainers.append(TrendViewModel(trend: trend1))
        let trend2 = Trend(title: "Pinterest", code: "PINS", value: "-4.77", imageTitle: "pinterest")
        topGainers.append(TrendViewModel(trend: trend2))
        let trend3 = Trend(title: "Slack Technologies", code: "WORK", value: "-5.99", imageTitle: "slack")
        topGainers.append(TrendViewModel(trend: trend3))
        
        topSellers.append(TrendViewModel(trend: trend3))
        let trend5 = Trend(title: "Evoqua Water", code: "AQUA", value: "+5.99", imageTitle: "aqua")
        topSellers.append(TrendViewModel(trend: trend5))
    }
}

struct TrendViewModel {
    
    let trend: Trend
    
    var title: String {
        return trend.title
    }
    
    var code: String {
        return trend.code
    }
    
    var value: String {
        return trend.value
    }
    
    var trendImage: UIImage {
        return UIImage(named: trend.imageTitle)!
    }
    
    var valueBackgroundColor: UIColor {
        return UIColor(hex: "f95159") // "38d6a4"
    }
}
