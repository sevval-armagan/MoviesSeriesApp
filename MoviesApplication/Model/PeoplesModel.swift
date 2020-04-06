//
//  PeoplesModel.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 1.04.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation

struct PeoplesModel : Codable {
    let page : Int?
    let results : [PeopleResults]?
    let total_pages : Int?
    let total_results : Int?
}

struct Known_for : Codable {
    var adult : Bool?
    var backdrop_path : String?
    var first_air_date : String?
    var genre_ids : [Int]?
    var id : Int?
    var media_type : String?
    var name : String?
    var origin_country : [String?]?
    var original_language : String?
    var original_title : String?
    var overview : String?
    var poster_path : String?
    var releaseDate : String?
    var title : String?
    var video : Bool?
    var vote_average : Double?
    var vote_count : Int?
}

struct PeopleResults : Codable {
    let adult : Bool?
    let gender : Int?
    let id : Int?
    var known_for : [Known_for]?
    let known_for_department : String?
    let name : String?
    let popularity : Float?
    let profile_path : String?
}
