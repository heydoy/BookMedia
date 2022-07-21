//
//  BookDetailViewController.swift
//  BookMedia
//
//  Created by Doy Kim on 2022/07/21.
//

import UIKit
import Kingfisher

class BookDetailViewController: UIViewController {
    
    var bgColor: UIColor = .systemGray6
    var imageLink: String = ""
    var movie = Movie(title: "", releaseDate: "", runtime: 0, overview: "", rate: 0.0)
    
    static let identifier = "BookDetailViewController"
    
    @IBOutlet weak var bookBackgroundView: UIView!
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookRateLabel: UILabel!
    @IBOutlet weak var bookWebLinkButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designView()

    }

    @IBAction func webLinkButtonTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: BookWebViewController.identifier) as! BookWebViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func designView() {
        
        bookBackgroundView.backgroundColor = bgColor
        
        bookTitleLabel.text = movie.title
        bookImageView.image = UIImage(named: movie.title)!
        bookImageView.layer.cornerRadius = 12
        bookImageView.clipsToBounds = true

        bookRateLabel.text = "평점 \(movie.rate)"
        
        
    }
    
}
