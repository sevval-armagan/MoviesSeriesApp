//
//  MoviesVC.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 15.03.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit
import SnapKit
// TODO: Açıklma(English)
class MoviesVC: UIViewController{
    
    let container = UIView()
    func setContainer(){
        view.addSubview(container)
        container.snp.makeConstraints { (make) in
            make.top.equalTo(view)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            //make.width.equalTo(view)
            make.height.equalTo(view)
        }
    }
    
    
    let todayLabel = UILabel()
    func setTodayLabel() {
        container.addSubview(todayLabel)
        todayLabel.snp.makeConstraints { (make) -> Void  in
            todayLabel.text = "Today"
            todayLabel.textColor = .white
            todayLabel.font = todayLabel.font.withSize(30)
            make.height.equalTo(50)
            make.top.equalTo(container).offset(95)
            make.leading.equalTo(container).offset(10)
            make.trailing.equalTo(container).offset(-10)
        }
    }
    
    
    let newTrendLabel = UILabel()
    func setnewTrendLabel() {
        container.addSubview(newTrendLabel)
        newTrendLabel.snp.makeConstraints { (make) -> Void  in
            newTrendLabel.text = "New and Trending"
            newTrendLabel.textColor = .lightGray
            newTrendLabel.font = newTrendLabel.font.withSize(30)
            make.height.equalTo(40)
            make.top.equalTo(todayLabel.snp.bottom)
            make.leading.equalTo(container).offset(10)
            make.trailing.equalTo(container).offset(-10)
        }
    }
    
    fileprivate let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    func setCollectionView(){
        container.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(container)
            make.top.equalTo(newTrendLabel.snp.bottom).offset(10)
            make.leading.equalTo(container).offset(20)
            make.trailing.equalTo(container.snp.trailing).offset(-20)
            make.bottom.equalTo(container.snp.bottom)
        }
    }
    
   
    func setupDelegate(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContainer()
        setTodayLabel()
        setnewTrendLabel()
        setCollectionView()
        setupDelegate()
        self.homePageViewModel.getData()
        
        
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: collectionView.frame.size.height)
        flowLayout.scrollDirection = .vertical
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 5.0)
        collectionView.collectionViewLayout = flowLayout
        
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
            let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
            let pageSide = (layout.scrollDirection == .vertical) ? self.pageSize.width : self.pageSize.height
            let offset = (layout.scrollDirection == .vertical) ? scrollView.contentOffset.x : scrollView.contentOffset.y
            currentPage = Int(floor(offset - pageSide / 2) / pageSide + 1)
        }
    }
    
    
    fileprivate var currentPage: Int = 0 {
        didSet{
            print("şevval buraka aşık <3")
        }
    }
    fileprivate var pageSize: CGSize{
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .vertical {
            pageSize.width += layout.minimumLineSpacing
        } else{
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    lazy var homePageViewModel: HomePageViewModel = {
        let homePageVM = HomePageViewModel()
        homePageVM.delegate = self
        return homePageVM
    }()
}
extension MoviesVC: HomePageViewModelDelegate{
    func homePagerequestCompleted() {
        DispatchQueue.main.async {
            
        }
    }
}



extension MoviesVC : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        let a = homePageViewModel.homePageArray[0].results![indexPath.row].poster_path!
        let url = URL(string: "https://image.tmdb.org/t/p/original" + a)
        print(url)
        URLSession.shared.dataTask(with: url!){
            (data,response, error) in
            if error != nil {
                print("error1")
                return
            }
            DispatchQueue.main.async {
                cell.posterImage.image = UIImage(data: data!)
                
            }
        }.resume()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 300, height: 450)
    }
    
    //TODO: Cell'lerin kenarlara olan uzaklıkları
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
    
}

