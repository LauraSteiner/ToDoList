//
//  ContentView.swift
//  ToDoList
//
//  Created by Laura Steiner on 5/13/25.
//

import SwiftUI

struct ToDoListView: View {
	
    var body: some View {
		NavigationStack {
			List {
				ForEach(1..<101, id: \.self){ number in
					NavigationLink("Item \(number)") {
						DetailView(passedValue: String(number))
					}
				}
			}
			.listStyle(.plain)
			.navigationTitle("To Dos")
			.navigationBarTitleDisplayMode(.automatic)
		}
    }
}

#Preview {
    ToDoListView()
}
