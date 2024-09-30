//
//  QuotesCategoryViewController.swift
//  QuotesApp
//
//  Created by Saranvignesh Soundararajan on 16/02/23.
//

import UIKit


class QuotesCategoryViewController: UIViewController {
    
    // MARK: - Variable for storing selected category
    let userDefault = UserDefaults.standard
    
    
    // MARK: - Creating instance for QuotesCategoryViewModel
    var viewmModel = QuotesCategoryViewModel()
    
    // MARK: - Variable for storing quotes categories
    var quotesCatData: QuoteCategory?
    
    // MARK: - Creating instance for coordinator
    var coordinator: MainCoordinator?
    
    lazy var catTableView: UITableView = {
        var catTableView = UITableView()
        return catTableView
        
    }()
    
    // MARK: - Quotes categories array
    var quoteCategory: [String] = ["Art","Funny","Inspire","Life","Love","Management","Sports","Students"]


    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        
//        viewmModel.apiToGetCat { _, _ in
//            self.quotesCatData = self.viewmModel.quotesCat
//            print((self.quotesCatData?.contents.categories)?.art)
//            DispatchQueue.main.async {
//                self.catTableView.reloadData()
//            }
//
//        }

        
        
    }
    
    
    // MARK: - Seting up tableview
    func setTableView() {
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        self.view.addSubview(catTableView)
        catTableView.snp.makeConstraints { make in
            make.width.equalTo(displayWidth)
            make.height.equalTo(displayHeight)
        }
        catTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        catTableView.delegate = self
        catTableView.dataSource = self
    }
    
    

    
}

extension QuotesCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return (quotesCatData?.success.total) ?? 0
        return quoteCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = catTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "Rockwell", size: 20)
        cell.textLabel?.text = "\(quoteCategory[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        catTableView.deselectRow(at: indexPath, animated: true)
        userDefault.set("\(quoteCategory[indexPath.row])", forKey: "selectedCat")
        coordinator?.gotoCatQod()
        print(quoteCategory[indexPath.row])
    }

    
    
}
