//
//  getAlarmCountServicce.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/12/16.
//

import Foundation
import Alamofire
import SwiftyJSON


struct HomeAlarmCountService {
    static let shared = HomeAlarmCountService()

    
    func getAlarmList(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        
        
        
        
        let alarmURL : String = APIConstants.getAlarmCount

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
            
        case 200 ... 299:  return isAlarm(by: json)
        case 400 ... 499:  return .pathErr
        case 500 ... 599: return .serverErr
        default: return .networkFail
        }
    }
    
    
    
    private func isAlarm(by json: JSON) -> NetworkResult<Any> {
        
        let data = json["data"] as JSON
        let alarmCount = data[0]["alert"].intValue
        
        return .success(alarmCount)
    }
}

