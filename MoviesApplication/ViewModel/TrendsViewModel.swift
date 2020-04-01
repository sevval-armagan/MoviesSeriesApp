//
//  TrendsViewModel.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 31.03.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation
import Alamofire

protocol TrendsViewModelDelegate{
    func requestCompleted()
}

class TrendsViewModel{
    var array = [TrendsModel]()
     var delegate: TrendsViewModelDelegate?
}



extension TrendsViewModel{
    func getData(){
        // parse işlemleri yapılacak
        AF.request("https://api.themoviedb.org/3/trending/all/day?api_key=1218591a465b03f80cfebb0ef37a2275").response{ response in
           // debugPrint(response)
            
        }
        self.delegate?.requestCompleted()
    }
}
