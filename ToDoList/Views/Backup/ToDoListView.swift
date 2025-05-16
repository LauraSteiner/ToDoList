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
	@State private var sortSelection: SortOption = .asEntered
	@Query var todos: [ToDo]
	
	var body: some View {
		NavigationStack {
			List {
				ForEach(todos){ todo in
					VStack(alignment: .leading) {
						HStack {
							Image(systemName:  todo.isCompleted ? "checkmark.rectangle" : "rectangle")
								.onTapGesture {ture in
									
									todo.isCompleted.toggle()
									
									guard let _ = try? modelContext.save() else {
										print("ERROR: save after toggle on ToDoListView did not work.")
										return
									}
								}
							NavigationLink {
								DetailView(todo: todo)
							} label: {
								Text(todo.todo)
							}
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
						}
						.font(.title2)
						HStack{
							if todo.reminderIsOn {
								// TODO: change from hack of adding an invisible rectangle to a better way to align second row with first
								Image(systemName:   "rectangle")
									.font(.title2)
									.opacity(0)
								Text(todo.dueDate.formatted(date: .abbreviated	, time: .shortened))
									.foregroundStyle(.secondary)
								Image(systemName: "calendar")
									.symbolRenderingMode(.multicolor)
							}
						}
					}
				}
				/*
				 .onDelete{ indexSet in
				 indexSet.forEach { index in
				 modelContext.delete(todos[index])
				 guard let _ = try? modelContext.save() else {
				 print("ERROR: save after delete on ToDoListView did not work.")
				 return
				 }
				 }
				 }
				 */
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
				ToolbarItem(placement: .bottomBar) {
					Picker("", selection: $sortSelection) {
						ForEach(SortOption.allCases, id: \.self) { sortOrder in
							Text(sortOrder.rawValue)
						}
					}
					.pickerStyle(.segmented)
				}
			}
		}
	}
}

#Preview {
	ToDoListView()
		.modelContainer(ToDo.preview)
}
