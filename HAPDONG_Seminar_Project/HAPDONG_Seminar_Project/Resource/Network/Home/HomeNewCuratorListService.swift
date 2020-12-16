//
//  getNewCuratorListService.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/12/16.
//

import Foundation
import Alamofire
import SwiftyJSON


struct HomeNewCuratorListService {
    static let shared = HomeNewCuratorListService()

    
    func getCuratorList(completion: @escaping (NetworkResult<Any>) -> Void) {
        

        
        let URL : String = APIConstants.getNewCuratorImage

        let dataRequest = AF.request(URL, method  : .get, encoding:
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
        
        let data = json["data"] as JSON
        
        var imageList : [String] = []
        
        
        if data.arrayValue.count > 0
        {
            for i in 0 ... data.arrayValue.count - 1
            {
                imageList.append(data[i]["profileUrl"].stringValue)
            }
        }
        
        return .success(imageList)
    }
}

