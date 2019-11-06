//
//  APIManager.swift
//  MVVMDemo
//
//  Created by MAC on 06/11/2019.
//  Copyright © 2019 Holo. All rights reserved.
//

import Foundation
import Moya

class APIManager {
    
  private init(){}
    
    static let apiSharredInistance = APIManager()
    
    typealias newsCompletion = ((Bool , [Article]?) -> Void)
    
    lazy var apiProvider: MoyaProvider<APIService> = {
        return MoyaProvider<APIService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    }()
    
    func loadNewsData(with countryCode : String , and pageOffset : Int ,completion: @escaping newsCompletion){
        apiProvider.request(.getNews(country: countryCode, pageOffser: pageOffset), completion: { result in
            switch result {
            case let .success(response):
                do {
                    print("response success")
                    let loadedData = try response.mapObject(NewsResonse.self)
                    let artilces = loadedData.articles
                    completion(true , artilces)
                }
                catch {
                    // Server Error
                     print("Request is not succesfull From Server ")
                    completion(false, [])
                }
            case let .failure(error):
                // Network Error
                print(error.errorDescription ?? "Unknown error description")
                completion(false, [])
            }
        })
    }
    
    
    
    
}
