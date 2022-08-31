//
//  Service.swift
//  RequestAPI
//
//  Created by leo asula on 31/08/2022.
//

import Foundation
import Alamofire

class Service {
    var baseURL = ""
    typealias universitiesCallBack = (_ universities: [University]?, _ state: Bool, _ mess: String) -> Void
    var callBack:universitiesCallBack?
    
    init(baseUrl: String) {
        self.baseURL = baseUrl
    }
    
    //MARK: CALL API GET METHOD
    func getAllUniversities() {
        AF.request(baseURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response(completionHandler: { (response) in
            guard let data = response.data else {
                self.callBack?(nil, false, "")
                return}
            do {
                let universities = try JSONDecoder().decode([University].self, from: data)
                self.callBack?(universities, true, "")
            }
            catch {
                self.callBack?(nil, false, error.localizedDescription)
            }
        })
    }
    
    func completionHandle(callBack: @escaping universitiesCallBack){
        self.callBack = callBack
    }
}
