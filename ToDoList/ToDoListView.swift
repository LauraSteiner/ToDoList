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
					/*
					.swipeActions {
						Button("Delete", role: .destructive) {
							modelContext.delete(todo)
							// The following updates the db right away
							guard let _ = try? modelContext.save() else {
								print("ERROR: save after delete on ToDoListView did not work.")
								return
							}
						}
					}
					 */
				}
				.onDelete{ indexSet in
					indexSet.forEach { index in
						modelContext.delete(todos[index])
						guard let _ = try? modelContext.save() else {
							print("ERROR: save after delete on ToDoListView did not work.")
							return
						}
					}
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
