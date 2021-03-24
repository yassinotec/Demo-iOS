//
//  ContentView.swift
//  Demo
//
//  Created by Yassine ElBadaoui on 2021/03/23.
//

import SwiftUI

struct ContentView: View {
	
	let items = [
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
	
	var body: some View {
		NavigationView {
			List(items) { item in
				NavigationLink(destination: DetailView(item: item)) {
					ItemRow(item: item)
				}
			}
//			.accentColor(.init(red: 77, green: 116, blue: 217))
			.navigationTitle("Demo")
		}
		
	}
}

struct ItemRow: View {
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
	
	var formattedPrice: String {
		currencyFormatter.string(from: NSNumber(value: Double(item.price))) ?? "$0"
	}
	
	var body: some View {
		HStack {
			Text(item.name)
			Spacer()
			Text(formattedPrice)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

struct Item: Identifiable {
	let id = UUID()
	let name: String
	let price: Int
	let keywords: [String]
}
