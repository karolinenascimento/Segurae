//
//  modelAPI.swift
//  SeguraeApp
//
//  Created by Vinicius on 28/09/22.
//

import Foundation

struct Value: Codable {
    let usdbrl: Usdbrl
    
    enum CodingKeys: String, CodingKey {
        case usdbrl = "USDBRL"
    }
}

// MARK: - Usdbrl
struct Usdbrl: Codable {
    let code, codein, name, high: String
    let low, varBid, pctChange, bid: String
    let ask, timestamp, createDate: String
    
    enum CodingKeys: String, CodingKey {
        case code, codein, name, high, low, varBid, pctChange, bid, ask, timestamp
        case createDate = "create_date"
    }
}
