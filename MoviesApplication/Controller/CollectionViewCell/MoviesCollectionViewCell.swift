//
//  MoviesCollectionViewCell.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 19.03.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    
    override init(frame : CGRect){
        super.init(frame : frame)
        posterImageContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let posterImage : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.red
        return image
    }()
    
    private func posterImageContraints(){
        self.contentView.addSubview(posterImage)
        posterImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview()
            
        }
    }
    
}

