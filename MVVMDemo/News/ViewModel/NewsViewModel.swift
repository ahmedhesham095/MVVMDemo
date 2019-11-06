//
//  NewsViewModel.swift
//  MVVMDemo
//
//  Created by MAC on 06/11/2019.
//  Copyright © 2019 Holo. All rights reserved.
//

import Moya_ObjectMapper
import Moya
import ObjectMapper


class NewsViewModel : NSObject {
    
    var delegate : NewsProtocol?
    var articles : [Article]?
    init(with delegate: NewsProtocol) {
        self.delegate = delegate
    }
    
    func newsSize() -> Int {
        return articles?.count ?? 0
    }
    
    func loadNews()  {
        delegate?.showLoader()
        APIManager.apiSharredInistance.loadNewsData(with: "us" , and: 10)
        { (isSuccessful, news) in
            self.delegate?.hideLoader()
            if isSuccessful {
                self.articles = news
                self.delegate?.configureUI(with: self.articles ?? [], and: "success")
            }
        }
    }
    
    func  renderNewsCell(with indexPath : IndexPath) -> NewsCellViewModel {
        let myNewsModel = NewsCellViewModel(with: articles?[indexPath.row])
        return myNewsModel
    }
}

