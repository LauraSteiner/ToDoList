//
//  ContentView.swift
//  ToDoList
//
//  Created by Laura Steiner on 5/13/25.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
	
	@State private var sheetIsPresented = false
	@Environment(\.modelContext) var modelContext
	@Query var todos: [ToDo]
	
    var body: some View {
		NavigationStack {
			List {
				ForEach(todos){ todo in
					NavigationLink {
						DetailView(todo: todo)
					} label: {
						Text(todo.todo)
					}
					.font(.title2)
				}
			}
			.listStyle(.plain)
			.fullScreenCover(isPresented: $sheetIsPresented){
				NavigationStack{
					DetailView(todo: ToDo())
				}
			}
			.navigationTitle("To Dos")
			.navigationBarTitleDisplayMode(.automatic)
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Button {
						sheetIsPresented.toggle()
					} label: {
						Image(systemName: "plus")
					}
				}
			}
		}
    }
}

#Preview {
    ToDoListView()
		.modelContainer(for: ToDo.self, inMemory: true)
}
