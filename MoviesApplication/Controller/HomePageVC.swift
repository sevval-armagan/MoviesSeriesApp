//
//  HomePageVC.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 15.03.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit
import SnapKit

class HomePageVC: UIViewController {
    
    
    let scrollView = UIScrollView()
    func setScrollView(){
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(0)
            make.leading.equalTo(view).offset(0)
            make.trailing.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0)
        }
    }
    
    let container = UIView()
    func setContainer(){
        container.backgroundColor = UIColor.green
        scrollView.addSubview(container)
        container.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView.snp.top)
            make.left.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(1300)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-20)
        }
    }
    
    //CollectionView
    fileprivate let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let movieCView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        movieCView.translatesAutoresizingMaskIntoConstraints = false
        movieCView.register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: "movieCell")
        return movieCView
    }()
    
    func setupDelegate(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    let trendsLabel = UILabel()
    let peopleLabel = UILabel()
    
    func setTrendsLabel() {
        container.addSubview(trendsLabel)
        trendsLabel.snp.makeConstraints { (make) -> Void  in
                   trendsLabel.text = "Trendler"
                   trendsLabel.textColor = .white
                   make.height.equalTo(45)
                   make.top.equalTo(container).offset(10)
                   make.leading.equalTo(container).offset(10)
                   make.trailing.equalTo(container).offset(-10)
               }
        }
    func setPeoplesLabel(){
        container.addSubview(peopleLabel)
        peopleLabel.snp.makeConstraints { (make) -> Void in
                   peopleLabel.text = "Popular People"
                   peopleLabel.textColor = .white
                   make.width.equalTo(container)
                   make.height.equalTo(45)
                   make.topMargin.equalTo(collectionView.snp.bottom).offset(10)
               }
}
    func setMoviesCollectionView(){
        container.addSubview(collectionView)
        collectionView.backgroundColor = .yellow
            collectionView.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(container)
                make.top.equalTo(trendsLabel.snp.bottom)
                make.height.equalTo(220)
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
        setContainer()
        setupDelegate()
        setTrendsLabel()
        setMoviesCollectionView()
        setPeoplesLabel()
        
    }
    
    
}



//Collection View Extensions
extension HomePageVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MoviesCollectionViewCell
        cell.label.text = "sevval"
        cell.backgroundColor = .green
        cell.image.image = UIImage(named: "homePage")
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    //TODO: Cell'lerin kenarlara olan uzaklıkları
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
}

