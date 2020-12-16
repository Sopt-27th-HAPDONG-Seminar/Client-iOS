//
//  NetworkResult.swift
//  HAPDONG_Seminar_Project
//
//  Created by 송지훈 on 2020/12/17.
//

import Foundation


enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
