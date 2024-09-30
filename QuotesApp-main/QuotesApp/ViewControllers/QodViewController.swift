//
//  ViewController.swift
//  QuotesApp
//
//  Created by Saranvignesh Soundararajan on 16/02/23.
//

import UIKit
import SnapKit

class QodViewController: UIViewController {
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    
    // MARK: - Creating instance for coordinator
    var coordinator: MainCoordinator?
    
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
    
    lazy var qodLabel: UILabel = {
        let qodLabel = UILabel()
        qodLabel.text = "QUOTE OF THE DAY"
        qodLabel.textColor = .white
        qodLabel.font = UIFont(name: "Rockwell", size: 30)
        qodLabel.textAlignment = .center
        return qodLabel
        
    }()
    
    lazy var quoteLabel: UILabel = {
        let quoteLabel = UILabel()
        quoteLabel.textColor = .white
        quoteLabel.textAlignment = .center
        quoteLabel.numberOfLines = 0
        quoteLabel.font = UIFont(name: "Rockwell", size: 40)
        return quoteLabel
        
    }()
    
    lazy var quoteImg: UIImageView = {
        let quoteImg = UIImageView()
        return quoteImg
        
    }()
    
    lazy var authorLabel: UILabel = {
        let authorLabel = UILabel()
        authorLabel.textColor = .white
        authorLabel.numberOfLines = 0
        authorLabel.font = UIFont(name: "Rockwell", size: 20)
        authorLabel.textAlignment = .center
        return authorLabel
        
    }()
    
    lazy var menuBtn: UIButton = {
        let menuBtn = UIButton()
        menuBtn.tintColor = .black
        menuBtn.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        menuBtn.addTarget(self, action: #selector(showCat), for: .touchUpInside)
        return menuBtn
        
    }()
    
    // MARK: - Buttonn action for menu
    @objc func showCat() {
        print("Categories button tapped")
        coordinator?.gotoCategories()
    }
    
    // MARK: - Creating instance for QodViewModel
    var viewModel = QodViewModel()
    
    // MARK: - Variable for storing qod data
    var qodData: Qod?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .red
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuBtn)
        subView()
        
        viewModel.apiToGetQod { res, err in
            self.qodData = res
            DispatchQueue.main.async {
                self.scrollViewContainer.reloadInputViews()
                self.quoteLabel.text = "\((self.qodData?.contents.quotes[0].quote)!)"
                self.authorLabel.text = "-  \((self.qodData?.contents.quotes[0].author)!)"
                self.quoteImg.downloaded(from: (self.qodData?.contents.quotes[0].background)!)
                
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
            make.height.equalTo(self.view.frame.height)
            
        }
        
        
        containerView.addSubview(quoteImg)
        quoteImg.snp.makeConstraints { make in
            make.topMargin.equalToSuperview()
            make.height.equalTo(containerView.snp.height)
            make.width.equalTo(containerView.snp.width)
        }
        
        containerView.addSubview(qodLabel)
        qodLabel.snp.makeConstraints { make in
            make.width.equalTo(contentViewSize)
            make.height.equalTo(100)

        }
        
        containerView.addSubview(quoteLabel)
        quoteLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(qodLabel.snp.bottomMargin).offset(50)
            make.leftMargin.equalToSuperview().offset(20)
            make.rightMargin.equalToSuperview().offset(-20)

        }

        containerView.addSubview(authorLabel)
        authorLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(quoteLabel.snp.bottomMargin).offset(50)
            make.rightMargin.equalToSuperview().offset(-20)
            make.leftMargin.equalToSuperview().offset(20)


        }
        
    }


}




