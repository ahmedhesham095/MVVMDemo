//
//  NewsViewController.swift
//  MVVMDemo
//
//  Created by MAC on 06/11/2019.
//  Copyright © 2019 Holo. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController  {
    
    @IBOutlet weak var newsTable: UITableView!
    lazy var viewModel :  NewsViewModel = {
        return NewsViewModel(with: self)
    }()
    lazy var utils :  ViewControllerUtils = {
          return ViewControllerUtils()
      }()
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTable.delegate = self
        newsTable.dataSource = self
        newsTable.rowHeight = UITableView.automaticDimension
        newsTable.register(UINib(nibName: "NewsViewCell", bundle: nil), forCellReuseIdentifier: "newscell")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.loadNews()
    }
}
extension NewsViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsSize()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTable.dequeueReusableCell(withIdentifier: "newscell", for: indexPath) as! NewsViewCell
        cell.configure(with: viewModel.renderNewsCell(with: indexPath))
        return cell
    }
}

extension NewsViewController : NewsProtocol {
    func configureUI(with articles: [Article], and message: String?) {
        self.newsTable.reloadData()
    }
    
    func showLoader() {
        self.utils.showActivityIndicator(uiView: self.view)
    }
    
    func hideLoader() {
        self.utils.hideActivityIndicator(uiView: self.view)
    }
}
