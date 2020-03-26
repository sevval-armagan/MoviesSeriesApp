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
       // labelContraints()
        imageContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "asdasd"
        return label
    }()
    
    private func labelContraints(){
        self.contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            
        }
    }
    
    
    let image : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.red
        
        return image
    }()
    
    private func imageContraints(){
        self.contentView.addSubview(image)
        image.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview()
            
        }
    }
    
}


//Contraintlerini kendin nasıl istiyorsan ayarlarsın. Ben şuan ordaya koydu. Height ve width vermedim versem mesele şöyle olur.
//Tamam mıdır?. Sabit bir yükseklikle verebilirsin. Cihaza göre de ayarlayabilirsin.
//Şuan mesela hiçbir contraints hatası yok. Olursa çıkar buraya. İphone 8 de ve 11 pro max üzerinde ayrı ayrı çalıştır.Hatanı daha çok farkedersin.
//Çıkıyorum ben sana kolay b igerbir şet dahasoracam ??
