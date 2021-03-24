//
//  Item.swift
//  Demo
//
//  Created by Yassine ElBadaoui on 2021/03/25.
//  Copyright © 2021 Demo Inc. All rights reserved.
//

import Foundation

struct Item: Decodable, Hashable {
	let name: String
	let price: Int
	let keywords: [String]
}
