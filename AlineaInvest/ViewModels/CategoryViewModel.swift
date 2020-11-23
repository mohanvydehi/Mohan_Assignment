//
//  CategoryViewModel.swift
//  AlineaInvest
//
//  Created by Mohan on 24/11/20.
//

import Foundation

class CategoryListViewModel {
    
    var categories: [CategoryViewModel]
    
    init() {
        self.categories = [CategoryViewModel]()
    }
    
    func loadDummyData() {
        
        categories.removeAll()
        
        let stocks = Category(title: "Stocks", imageTitle: "", colorHex: "948ffd")
        categories.append(CategoryViewModel(category: stocks))
        
        let etf = Category(title: "ETFs", imageTitle: "", colorHex: "3d36c1")
        categories.append(CategoryViewModel(category: etf))
        
        let crypto = Category(title: "Crypto", imageTitle: "", colorHex: "fdcd30")
        categories.append(CategoryViewModel(category: crypto))
    }
}

extension CategoryListViewModel {
    
    func categoryViewModel(at index: Int) -> CategoryViewModel {
        return categories[index]
    }
}

struct CategoryViewModel {
    let category: Category
}

extension CategoryViewModel {
    
    var title: String {
        return category.title
    }
    
    var imageTitle: String {
        return category.imageTitle
    }
    
    var colorHex: String {
        return category.colorHex
    }
}
