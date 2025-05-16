//
//  DetailView.swift
//  ToDoList
//
//  Created by Laura Steiner on 5/13/25.
//

import SwiftUI
import SwiftData

struct DetailView: View {
	@Environment(\.dismiss) var dismiss
	@Environment(\.modelContext) var modelContext
	
	@State var todo: ToDo
	
	@State private var item = ""
	@State private var reminderIsOn = false
	@State private var dueDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date.now) ?? Date.now + (60*60*24)
	@State private var notes = ""
	@State private var isCompleted = false
	
	var body: some View {
		List{
			TextField("Enter a new task", text: $item)
				.font(.title)
				.textFieldStyle(.roundedBorder)
				.padding(.vertical)
				.listRowSeparator(.hidden)
			
			Toggle("Set reminder?", isOn: $reminderIsOn)
				.padding(.top)
				.listRowSeparator(.hidden)
			DatePicker("Date", selection: $dueDate)
				.listRowSeparator(.hidden)
				.padding(.bottom)
				.disabled(reminderIsOn == false)
			
			Text("Notes")
				.padding(.top)
			TextField("Notes", text: $notes, axis: .vertical)
				.textFieldStyle(.roundedBorder)
				.listRowSeparator(.hidden)
				.lineLimit(4...10)
			
			Toggle("Completed", isOn: $isCompleted)
				.padding(.top)
				.listRowSeparator(.hidden)
		}
		.listStyle(.plain)
		.onAppear {
			item = todo.todo
			reminderIsOn = todo.reminderIsOn
			dueDate = todo.dueDate
			notes = todo.notes
			isCompleted = todo.isCompleted
		}
		.navigationBarBackButtonHidden()
		.toolbar {
			ToolbarItem(placement: .topBarLeading) {
				Button("Cancel") {
					dismiss()
				}
			}
			ToolbarItem(placement: .topBarTrailing) {
				Button("Save") {
					todo.todo = item
					todo.reminderIsOn = reminderIsOn
					todo.dueDate = dueDate
					todo.notes = notes
					todo.isCompleted = isCompleted
					modelContext.insert(todo)
					guard let _ = try? modelContext.save() else {
						print("Save in DetailView didn't work.")
						return
					}
					dismiss()
				}
			}
		}
	}
}

#Preview {
	//@Previewable @State var todo = ToDo(todo: "Be your awesome self!")
	
	NavigationStack {
		DetailView(todo: ToDo())
			.modelContainer(for: ToDo.self, inMemory: true)
	}
}
