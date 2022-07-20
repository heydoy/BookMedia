//
//  BookListCollectionViewCell.swift
//  BookMedia
//
//  Created by Doy Kim on 2022/07/20.
//

import UIKit
import Kingfisher

class BookListCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "BookListCollectionViewCell"
    
    var bgColorArray: [UIColor] {
        [
            UIColor(named: "bg-1")!, UIColor(named: "bg-2")!,
            UIColor(named: "bg-3")!, UIColor(named: "bg-4")!,
            UIColor(named: "bg-5")!, UIColor(named: "bg-6")!,
            UIColor(named: "bg-7")!
        ]
    }
    

    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookRate: UILabel!
    
    
    func configure(_ book : Movie, _ url : URL) {
        // 데이터
        //bookImageView.image = UIImage(named: book.title)
        bookImageView.kf.setImage(with: url)
        bookTitleLabel.text = book.title
        bookRate.text = "\(book.rate)"
        
        // 디자인
        self.layer.cornerRadius = 12
        self.backgroundColor = bgColorArray.randomElement()
        
        bookImageView.layer.cornerRadius = 8
        bookImageView.contentMode = .scaleAspectFill
        
        bookTitleLabel.textColor = .white
        bookTitleLabel.font = .boldSystemFont(ofSize: 17)
        
        bookRate.textColor = .white
        bookRate.font = .systemFont(ofSize: 14)
        
        
        
    }
    
}
