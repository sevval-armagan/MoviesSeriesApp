//
//  PeoplesViewModel.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 1.04.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation

protocol PeoplesViewModelDelegate{
    func requestCompleted()
}

class PeoplesViewModel{
    var array = [PeoplesModel]()
     var delegate: PeoplesViewModelDelegate?
}



extension PeoplesViewModel{
    func getData(){
        // parse işlemleri yapılacak
        
    }
}
