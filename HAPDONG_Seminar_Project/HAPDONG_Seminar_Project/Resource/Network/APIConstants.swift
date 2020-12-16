//
//  APIConstants.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/12/16.
//

import Foundation

struct APIConstants
{
    static var baseURL : String = "http://52.79.150.197:3000"
    
    
    static var getAlarmCount = APIConstants.baseURL + "/user/alert"
    static var getNewCuratorImage = APIConstants.baseURL + "/creator/new"
    static var getSharedComment = APIConstants.baseURL + "/comment/shared"
    static var getSubscriptCurator = APIConstants.baseURL + "/user/subscription"
    static var getAllCurator = APIConstants.baseURL + "/creator/all"
    
    
}
