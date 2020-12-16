//
//  getSubscribedCuratorService.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/12/16.
//

import Foundation
import Alamofire
import SwiftyJSON

struct CuratorSubscribedListService {
    static let shared = CuratorSubscribedListService()

    
    func getAlarmList(completion: @escaping (NetworkResult<Any>) -> Void) {
        

        let alarmURL : String = APIConstants.getSubscriptCurator

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
            
        case 200 ... 299:  return isCurator(by: json)
        case 400 ... 499:  return .pathErr
        case 500 ... 599: return .serverErr
        default: return .networkFail
        }
    }
    
    
    
    private func isCurator(by json: JSON) -> NetworkResult<Any> {
        
        
        
        var curatorList : [SubsribeCuratorDataModel] = []
        
        
        let data = json["data"] as JSON
        
        
        if data.arrayValue.count > 0
        {
            for i in 0 ... data.arrayValue.count - 1
            {
                
                var tagList : [String] = []
                
                for j in 0...data[i]["tag"].arrayValue.count - 1
                {
                    tagList.append(data[i]["tag"][j].stringValue)
                }
                
                let curator = SubsribeCuratorDataModel(name: data[i]["name"].stringValue,
                                                       job: data[i]["company"].stringValue + " " + data[i]["role"].stringValue,
                                                       isNew: (data[i]["ifNew"].intValue == 1),
                                                       tagList: tagList,
                                                       profileImage: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
                
                curatorList.append(curator)
               
            }
        }

        return .success(curatorList)
    }
}

