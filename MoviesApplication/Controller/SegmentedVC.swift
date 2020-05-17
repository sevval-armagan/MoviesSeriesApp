//
//  SegmentedVC.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 13.05.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit

class SegmentedVC: UIViewController {
    fileprivate let segmentedControl : UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Movies", "Series"])
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleSegmentedChange), for: .valueChanged)
        return sc
    }()
    
    @objc fileprivate func handleSegmentedChange(){
        print(segmentedControl.selectedSegmentIndex)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            view.backgroundColor = .green
        case 1:
            view.backgroundColor = .blue
        default:
            view.backgroundColor = .yellow
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

      setSegmnetedController()
       
    }
    
    func setSegmnetedController(){
        view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { (make) in
           make.top.equalTo(view).offset(95)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
            make.height.equalTo(60)
        }
        
        
    }
   
}
