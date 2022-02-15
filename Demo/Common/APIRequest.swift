//
//  APIRequest.swift
//  Demo
//
//  Created by Yassine ElBadaoui on 2021/03/25.
//  Copyright © 2021 TORANOTEC K.K. All rights reserved.
//

import Foundation

protocol APIRequestProtocol {
	func perform<T: Decodable>(with completion: @escaping (T?) -> Void)
}

typealias APIRequest = DummyAPIRequest
