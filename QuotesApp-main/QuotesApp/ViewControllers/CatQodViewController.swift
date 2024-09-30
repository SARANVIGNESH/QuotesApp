//
//  CatQodViewController.swift
//  QuotesApp
//
//  Created by Saranvignesh Soundararajan on 18/02/23.
//

import UIKit

class CatQodViewController: UIViewController {
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 1000)
    
    
    // MARK: - Creating instance for CatQodViewModel
    var viewModel = CatQodViewModel()
    
    // MARK: - Creating instance for coordinator
    var coordinator: MainCoordinator?
    
    // MARK: - Variable for storing category qod
    var catQodData: CatQod?
    
    let userDefault = UserDefaults.standard
    
    lazy var scrollViewContainer: UIScrollView = {
        let scrollViewContainer = UIScrollView(frame: .zero)
        scrollViewContainer.backgroundColor = .white
        scrollViewContainer.contentSize = contentViewSize
        scrollViewContainer.frame = view.bounds
        return scrollViewContainer
    }()
    
    lazy var containerView: UIView = {
        let containerView = UIView()
        return containerView
        
    }()
    
    lazy var catQodLabel: UILabel = {
        let catQodLabel = UILabel()
        if let catName = userDefault.string(forKey: "selectedCat") {
            catQodLabel.text = "\(catName.uppercased()) QUOTE OF THE DAY"
           print(catName)
        }
        
        catQodLabel.numberOfLines = 0
        catQodLabel.textColor = .white
        catQodLabel.font = UIFont(name: "Rockwell", size: 30)
        catQodLabel.textAlignment = .center
        return catQodLabel
        
    }()
    
    lazy var catQuoteLabel: UILabel = {
        let catQuoteLabel = UILabel()
        catQuoteLabel.textColor = .white
        catQuoteLabel.textAlignment = .center
        catQuoteLabel.numberOfLines = 0
        catQuoteLabel.font = UIFont(name: "Rockwell", size: 40)
        return catQuoteLabel
        
    }()
    
    lazy var catQuoteImg: UIImageView = {
        let catQuoteImg = UIImageView()
        return catQuoteImg
        
    }()
    
    lazy var catAuthorLabel: UILabel = {
        let catAuthorLabel = UILabel()
        catAuthorLabel.textColor = .white
        catAuthorLabel.numberOfLines = 0
        catAuthorLabel.font = UIFont(name: "Rockwell", size: 20)
        catAuthorLabel.textAlignment = .center
        return catAuthorLabel
        
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        subView()
        
        viewModel.apiToGetCatQod { res, err in
            self.catQodData = res
            DispatchQueue.main.async {
                self.scrollViewContainer.reloadInputViews()
                self.catQuoteImg.downloaded(from: "\((self.catQodData?.contents.quotes[0].background)!)")
                self.catQuoteLabel.text = "\((self.catQodData?.contents.quotes[0].quote)!)"
                self.catAuthorLabel.text = "-  \((self.catQodData?.contents.quotes[0].author)!)"

            }
        }
       
    }
    

    // MARK: - Setting up scrollview
    func subView() {
        view.addSubview(scrollViewContainer)
        scrollViewContainer.snp.makeConstraints { make in
            make.width.equalTo(view.bounds.width)
            make.height.equalTo(view.bounds.height)
        }
        
        scrollViewContainer.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(self.view.frame.height + 1000)
            
        }
        
        containerView.addSubview(catQuoteImg)
        catQuoteImg.snp.makeConstraints { make in
            make.topMargin.equalToSuperview()
            make.height.equalTo(containerView.snp.height)
            make.width.equalTo(containerView.snp.width)
        }
        
        containerView.addSubview(catQodLabel)
        catQodLabel.snp.makeConstraints { make in
            make.topMargin.equalToSuperview().offset(30)
            make.leftMargin.equalToSuperview().offset(20)
            make.rightMargin.equalToSuperview().offset(-20)

        }
        
        containerView.addSubview(catQuoteLabel)
        catQuoteLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(catQodLabel.snp.bottomMargin).offset(50)
            make.leftMargin.equalToSuperview().offset(20)
            make.rightMargin.equalToSuperview().offset(-20)

        }

        containerView.addSubview(catAuthorLabel)
        catAuthorLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(catQuoteLabel.snp.bottomMargin).offset(50)
            make.rightMargin.equalToSuperview().offset(-20)
            make.leftMargin.equalToSuperview().offset(20)
        }
        
    }
    

    

}
