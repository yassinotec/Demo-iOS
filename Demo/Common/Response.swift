//
//  Response.swift
//  Demo
//
//  Created by Yassine ElBadaoui on 2021/03/25.
//  Copyright © 2021 TORANOTEC K.K. All rights reserved.
//

import Foundation

/// Response.
struct Response: Decodable {
	/// Items.
	let items: [Item]
}
