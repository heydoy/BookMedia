//
//  BookListCollectionViewController.swift
//  BookMedia
//
//  Created by Doy Kim on 2022/07/20.
//

import UIKit


class BookListCollectionViewController: UICollectionViewController {

    let bookList = MovieInfo()
    
    var urlArray: [String] {
        [
            //미니언즈
            "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20210315_87%2F1615785089884t4jpd_JPEG%2Fmovie_image.jpg",
            //외계+인
            "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20220708_123%2F1657272256389R34Q0_JPEG%2Fmovie_image.jpg",
            //탑건
             "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20220609_163%2F1654756780376pI274_JPEG%2Fmovie_image.jpg",
            //러브앤썬더
            "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20220624_246%2F1656037646366OIPXJ_JPEG%2Fmovie_image.jpg",
            //로스트도터
            "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20220714_114%2F1657780525423jmTpw_JPEG%2Fmovie_image.jpg",
            //썸머 필름...
            "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20220707_188%2F1657158653715Xz0xj_JPEG%2Fmovie_image.jpg",
            //헤어질결심
            "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20220609_138%2F1654754279241LkRd0_JPEG%2Fmovie_image.jpg",
            //애프터양
            "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20220506_191%2F1651821842163UJo9R_JPEG%2Fmovie_image.jpg",
            //니얼굴
            "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20220523_118%2F1653272228021DOt1t_JPEG%2Fmovie_image.jpg"
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        
        let spacing: CGFloat = 12
        let inset: CGFloat = 20
        
        let size = UIScreen.main.bounds.width - (2 * inset) - spacing
        
        
        
        layout.itemSize = CGSize(width: size/2, height: size/2)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        
        collectionView.collectionViewLayout = layout

    }

    // 아이템 개수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookList.movie.count
    }
    
    // 아이템
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookListCollectionViewCell.identifier, for: indexPath) as? BookListCollectionViewCell else {
            return UICollectionViewCell()
            
        }
        
        let url = URL(string: urlArray[indexPath.row])!
        
        cell.configure(bookList.movie[indexPath.row], url)
        
        return cell
    }
    
    // 셀 선택
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: BookDetailViewController.identifier) as! BookDetailViewController
        
        vc.movie = bookList.movie[indexPath.row]
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    // 네비게이션 컨트롤러가 있으면 헤더가 안 보이는 걸까..?
    // 헤더
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        switch kind {
        case UICollectionView.elementKindSectionHeader :
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchHeaderCollectionReusableView.identifier, for: indexPath) as! SearchHeaderCollectionReusableView
            
            return header
            
            
        default :
            assert(false, "")
        }
    }
    
    // 헤더 사이즈
    
    
    // MARK: - Action
    @IBAction func searchButtonTapped(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: SearchResultViewController.identifier) as! SearchResultViewController
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .fullScreen
        
        self.present(nav, animated: true)
    }
    
}
