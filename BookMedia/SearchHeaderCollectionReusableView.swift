//
//  SearchHeaderCollectionReusableView.swift
//  BookMedia
//
//  Created by Doy Kim on 2022/07/21.
//

import UIKit

class SearchHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier =  "SearchHeaderCollectionReusableView"
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    
    @IBAction func userTextFieldEntered(_ sender: UITextField) {
        
        guard let text = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            return
        }
        search(text)
        
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
        userTextFieldEntered(userTextField)
        
    }
    
    func search(_ query: String) {
        
    }
    
}
