//
//  SearchResultViewController.swift
//  BookMedia
//
//  Created by Doy Kim on 2022/07/21.
//

import UIKit

class SearchResultViewController: UIViewController {

    static let identifier = "SearchResultViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "검색창"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonTapped))

    }
    
    @objc
    func closeButtonTapped() {
        self.dismiss(animated: true)
    }
    



}
