//
//  University.swift
//  RequestAPI
//
//  Created by leo asula on 31/08/2022.
//

import Foundation
import Codextended

struct University: Decodable {
    var name: String?
    var country: String?
    var alpha_two_code: String?
    
    init(from decoder: Decoder) throws {
        name = try? decoder.decode("name")
        country = try? decoder.decode("country")
        alpha_two_code = try? decoder.decode("alpha_two_code")
    }
}
