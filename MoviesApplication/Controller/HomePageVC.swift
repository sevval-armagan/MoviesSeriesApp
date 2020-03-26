//
//  HomePageVC.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 15.03.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit
import SnapKit

let trendlerLabel = UILabel()
let peopleLabel = UILabel()

class HomePageVC: UIViewController {


       let container = UIView()
    func setContainer(){
           self.view.addSubview(container)
           view.backgroundColor = UIColor.red
           
       }
       func containerLayout(){
           container.snp.makeConstraints{ (make) in
               make.top.leading.equalTo(view.safeAreaLayoutGuide).offset(0)
               make.trailing.equalTo(view).offset(-0)
               make.bottom.equalTo(view).offset(-0)
           }
       }
    // collection viewler olacak
    
    fileprivate let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let movieCView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        movieCView.translatesAutoresizingMaskIntoConstraints = false
     //silinecek   movieCView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "movieCell")
        movieCView.register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: "movieCell")
        return movieCView
    }()
    
    func setupDelegate(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setContainer()
              containerLayout()
       // let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 64.0))
        //self.view.addSubview(navBar);
        self.navigationController?.isNavigationBarHidden = true
        container.addSubview(trendlerLabel)
        container.addSubview(collectionView)
        container.addSubview(peopleLabel)
        setupDelegate()
    
        
        trendlerLabel.snp.makeConstraints { (make) -> Void  in
            trendlerLabel.text = "Trendler"
            trendlerLabel.textColor = .white
            make.height.equalTo(45)
           // make.topMargin.equalTo(view.snp.top).offset(100)
            make.top.equalTo(container).offset(10)
            make.leading.equalTo(container).offset(10)
            make.trailing.equalTo(container).offset(-10)
            
        }
        
        
        peopleLabel.snp.makeConstraints { (make) -> Void in
            peopleLabel.text = "Popular People"
            peopleLabel.textColor = .white
            make.width.equalTo(container)
            make.height.equalTo(45)
            make.topMargin.equalTo(collectionView.snp.bottom).offset(10)
        }
        
        collectionView.backgroundColor = .yellow
        collectionView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(container)
            make.top.equalTo(trendlerLabel.snp.bottom)
            make.height.equalTo(220)
        }
    }


}

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



