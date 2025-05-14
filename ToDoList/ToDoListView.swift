//
//  ContentView.swift
//  ToDoList
//
//  Created by Laura Steiner on 5/13/25.
//

import SwiftUI

struct ToDoListView: View {
	let todos: [String] = [
		"Learn Swift",
		"Build Apps",
		"Change the world",
		"Bring the awesome",
		"Take a vacation"
	]
	
    var body: some View {
		NavigationStack {
			List {
				ForEach(todos, id: \.self){ todo in
					NavigationLink(todo) {
						DetailView(passedValue: todo)
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
