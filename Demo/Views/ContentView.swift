//
//  ContentView.swift
//  Demo
//
//  Created by Yassine ElBadaoui on 2021/03/23.
//

import SwiftUI

struct ContentView: View {
	
	@StateObject private var viewModel = ViewModel()
	
	var body: some View {
		NavigationView {
			List(viewModel.items, id: \.self) { item in
				NavigationLink(destination: DetailView(item: item)) {
					ItemRow(item: item)
				}
			}
			.navigationTitle("Demo")
		}
		.onAppear(perform: viewModel.fetchItems)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ForEach(
			ColorScheme.allCases,
			id: \.self,
			content: ContentView().preferredColorScheme)
	}
}
