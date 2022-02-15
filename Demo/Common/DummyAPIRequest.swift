//
//  DummyAPIRequest.swift
//  Demo
//
//  Created by Yassine ElBadaoui on 2021/03/25.
//  Copyright © 2021 TORANOTEC K.K. All rights reserved.
//

import Foundation

/// API Request.
class DummyAPIRequest: APIRequestProtocol {
	
	func perform<T: Decodable>(with completion: @escaping (T?) -> Void) {
		let filename = "dummy-data.json"

		completion(load(filename))
	}
	
	/// Load array from JSON file.
	/// - Parameter filename: Filename.
	/// - Returns: Array of type `T`.
	func load<T: Decodable>(_ filename: String) -> T? {
		let data: Data
		guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
		else {
			NSLog("ERROR: Couldn't find \(filename) in main bundle.")
			return nil
		}
		
		do {
			data = try Data(contentsOf: file)
		} catch {
			NSLog("ERROR: Couldn't load \(filename) from main bundle:\n\(error)")
			return nil
		}
		
		do {
			return try JSON.decoder.decode(T.self, from: data)
		} catch {
			NSLog("ERROR: Couldn't parse \(filename) as \(T.self):\n\(error)")
			return nil
		}
	}
	
}
