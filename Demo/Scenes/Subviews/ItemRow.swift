//
//  ItemRow.swift
//  Demo
//
//  Created by Yassine ElBadaoui on 2021/03/25.
//  Copyright © 2021 TORANOTEC K.K. All rights reserved.
//

import SwiftUI

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

struct ItemRow_Previews: PreviewProvider {
	static var previews: some View {
		ItemRow(item: Constants.item)
	}
}
