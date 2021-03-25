//
//  Constants.swift
//  Demo
//
//  Created by Yassine ElBadaoui on 2021/03/25.
//  Copyright © 2021 Demo Inc. All rights reserved.
//

import Foundation

/// Constants.
struct Constants {
	/// Item.
	static let item =
		Item(name: "First Item",
				 price: 100,
				 keywords: ["red", "versatile", "inexpensive"])
	
	/// Item.
	static let bulkyItem =
		Item(name: "First Item",
				 price: 100,
				 keywords: ["red", "versatile", "inexpensive", "yellow", "interesting", "available", "green", "doorway", "out-of-stock", "bulky"])
	
	/// Items.
	static let items = [
		Item(name: "First Item",
				 price: 100,
				 keywords: ["red", "versatile", "inexpensive"]),
		Item(name: "Second Item",
				 price: 150,
				 keywords: ["yellow", "interesting", "available"]),
		Item(name: "Third Item",
				 price: 190,
				 keywords: ["green", "doorway", "out-of-stock"])
	]
	
}
