//
//  getArticleService.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/12/16.
//

import Foundation
import Alamofire
import SwiftyJSON

struct HomeArticleService {
    static let shared = HomeArticleService()

    
    func getAlarmList(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        
        
        
        
        let alarmURL : String = APIConstants.getSharedComment

        let dataRequest = AF.request(alarmURL, method  : .get, encoding:
            JSONEncoding.default)
        
     
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            
            
            case .success:
                
                
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                
                let json = JSON(value)
                
                let networkResult = self.judge(by: statusCode, json)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    
    private func judge(by statusCode: Int, _ json: JSON) -> NetworkResult<Any> {
        switch statusCode {
            
        case 200 ... 299:  return isArticle(by: json)
        case 400 ... 499:  return .pathErr
        case 500 ... 599: return .serverErr
        default: return .networkFail
        }
    }
    
    
    
    private func isArticle(by json: JSON) -> NetworkResult<Any> {
        
        
        
        var articleList : [ArticleDataModel] = []
        
        
        let data = json["data"] as JSON
        
        
        if data.arrayValue.count > 0
        {
            for i in 0 ... data.arrayValue.count - 1
            {
                let curator = CuratorDataModel(id: data[i]["Creator"]["id"].intValue,
                                               profileURL: data[i]["Creator"]["profileUrl"].stringValue,
                                               name: data[i]["Creator"]["name"].stringValue,
                                               role: data[i]["Creator"]["role"].stringValue,
                                               company: data[i]["Creator"]["company"].stringValue)
                
                let article = ArticleDataModel(title: data[i]["title"].stringValue,
                                               description: data[i]["description"].stringValue,
                                               articleImageURL: data[i]["articleImageUrl"].stringValue,
                                               articleTitle: data[i]["articleTitle"].stringValue,
                                               saveCount: data[i]["saveCount"].intValue,
                                               curator: curator,
                                               articleSource: data[i]["articleSource"].stringValue)
                
                articleList.append(article)
            }
        }

        return .success(articleList)
    }
}

