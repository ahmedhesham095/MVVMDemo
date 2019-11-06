//
//  NewsCellViewModel.swift
//  MVVMDemo
//
//  Created by MAC on 06/11/2019.
//  Copyright © 2019 Holo. All rights reserved.
//

import Foundation


class NewsCellViewModel: NSObject {
    
    var article : Article?

    init(with model : Article?) {
        self.article = model ?? nil
    }
    
    func getURL() -> String {
        return article?.urlToImage ?? ""
    }
    
    func getTitle() -> String {
        return article?.title ?? ""
    }
    
    func getAuthor() -> String {
        return article?.author ?? ""
    }
    
    func getDescriptionField() -> String {
        return article?.descriptionField ?? ""
    }
    
}
