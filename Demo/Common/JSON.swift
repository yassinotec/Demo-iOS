//
//  JSON.swift
//  Demo
//
//  Created by Yassine ElBadaoui on 2021/03/25.
//  Copyright © 2021 TORANOTEC K.K. All rights reserved.
//

import Foundation

/// JSON struct.
enum JSON {
	/// Encoder.
	static let encoder: JSONEncoder = {
		let encoder = JSONEncoder()
		encoder.dateEncodingStrategy = .iso8601
		encoder.outputFormatting = .prettyPrinted
		return encoder
	}()

	/// Decoder.
	static let decoder: JSONDecoder = {
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .secondsSince1970
		return decoder
	}()
}
