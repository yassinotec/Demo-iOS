//
//  DetailView.swift
//  Demo
//
//  Created by Yassine ElBadaoui on 2021/03/23.
//  Copyright © 2021 Demo Inc. All rights reserved.
//

import SwiftUI

struct DetailView: View {
	/// Item.
	var item: Item

	/// Currency formatter.
	var currencyFormatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.isLenient = true
		formatter.numberStyle = .currency
		formatter.currencyCode = "JPY"
		return formatter
	}()
	
	/// Formatted price.
	var formattedPrice: String {
		currencyFormatter.string(from: NSNumber(value: Double(item.price))) ?? "$0"
	}
	var body: some View {
		List {
			StringRow(name: "Name", value: item.name)
			StringRow(name: "Price", value: formattedPrice)
			CollectionRow(name: "Keywords", values: item.keywords)
		}
	}
}

struct DetailView_Previews: PreviewProvider {
	/// Item.
	static let item = Item(
		name: "First Item",
		price: 100,
		keywords: ["red", "versatile", "inexpensive"]
	)
	static var previews: some View {
		DetailView(item: item)
	}
}

struct StringRow: View {
	var name: String
	var value: String
	
	var body: some View {
		HStack {
			Text(name)
			Spacer()
			Text(value)
		}
	}
}

struct CollectionRow: View {
	var name: String
	var values: [String]
	private let tint = Color(.sRGB, red: 77, green: 116, blue: 217, opacity: 1)
	
	var body: some View {
		HStack {
			Text(name)
			Spacer()
			VStack {
				ForEach(values, id: \.self) { value in
					Text(value)
//						.padding()
						.background(tint)
				}
			}
		}
	}
}
