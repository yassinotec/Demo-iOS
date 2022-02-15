//
//  DetailView.swift
//  Demo
//
//  Created by Yassine ElBadaoui on 2021/03/23.
//  Copyright © 2021 TORANOTEC K.K. All rights reserved.
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
		currencyFormatter.string(from: NSNumber(value: Double(item.price))) ?? "¥0"
	}

	var priceView: some View {
		VStack {
			Text("Price")
				.font(.itemTitle)
			Text(formattedPrice)
				.font(.valueTitle)
		}
	}

	let columns: [GridItem] =
		Array(repeating: .init(.flexible()), count: 3)

	var keywordsView: some View {
		VStack {
			Text("Keywords")
				.font(.itemTitle)
			LazyVGrid(columns: columns, spacing: 10) {
				ForEach(item.keywords, id: \.self) { value in
					Text(value)
						.padding(.horizontal)
						.foregroundColor(.white)
						.background(Color.blue)
						.clipShape(Capsule())
				}
			}
		}
	}

	var body: some View {
		VStack {
			priceView
			Spacer()
				.frame(height: 20)
			keywordsView
		}
		.navigationBarTitle(Text(item.name), displayMode: .inline)
	}
}

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		ForEach(
			ColorScheme.allCases,
			id: \.self,
			content: DetailView(item: Constants.bulkyItem).preferredColorScheme
		)
	}
}
