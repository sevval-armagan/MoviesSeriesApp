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
            make.left.equalTo(view)
            make.width.equalTo(view)
            make.height.equalTo(view)
            make.bottom.equalTo(view.snp.bottom)
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
    
    
    fileprivate let tableView: UITableView = {
        var tableView = UITableView()
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    func setTableView(){
        container.addSubview(tableView)
        tableView.backgroundColor = .black
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(newTrendLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(container.snp.bottom)
        }
    }
    
    func setupDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        setContainer()
        setTodayLabel()
        setnewTrendLabel()
        setTableView()
        setupDelegate()
        
        
        self.homePageViewModel.getData()
        
        
        
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
            self.tableView.reloadData()
        }
    }
}


extension MoviesVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20//homePageViewModel.homePageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! TableViewCell
        cell.posterImage.backgroundColor = .purple
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
      //  var savedIndex = tableView.indexPathsForVisibleRows?.first
       // tableView.scrollToRow(at: savedIndex!, at: .top , animated: false) //top dediğin için olabilir
        
       //  tableView.scrollToNearestSelectedRow(at: UITableView.ScrollPosition.bottom, animated: true)
        cell.alpha = 0
        UIView.animate(withDuration: 0.75) {
                   cell.alpha = 1
               }

         
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
}
//Ben mi kaydıramıyorum bak bi
//Bak sen yemek yicem attığımı incele iyice tamam afiyet olsun sağolasın 
