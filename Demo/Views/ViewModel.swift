//
//  ViewModel.swift
//  Demo
//
//  Created by Yassine ElBadaoui on 2021/03/25.
//  Copyright © 2021 Demo Inc. All rights reserved.
//

import Foundation

class ViewModel: ObservableObject {
	
	@Published var items = [Item]()
	
	func fetchItems() {
		let request: APIRequestProtocol = APIRequest()
		request.perform { [weak self] (response: Response?) in
			guard let response = response else {
				self?.items = []
				return
			}
			self?.items = response.items
		}
	}
	
}
