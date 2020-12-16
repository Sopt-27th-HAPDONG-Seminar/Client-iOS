//
//  ArticleDataModel.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/12/17.
//

import Foundation


struct ArticleDataModel
{
    var title : String
    var description : String
    var articleImageURL : String
    var articleTitle : String
    var saveCount : Int
    var curator : CuratorDataModel
    var articleSource : String
    
}


struct CuratorDataModel
{
    var id : Int
    var profileURL : String
    var name : String
    var role : String
    var company : String
}
