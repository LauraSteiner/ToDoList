//
//  ToDo.swift
//  ToDoList
//
//  Created by Laura Steiner on 5/15/25.
//

import Foundation
import SwiftData

@MainActor
@Model
class ToDo {
	var todo: String = ""
	var reminderIsOn = false
	// Prof. G used Date.now + (60*60*24), since it's shorter
	var dueDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date.now) ?? Date.now + (60*60*24)
	var notes = ""
	var isCompleted = false
	
	init(todo: String = "", reminderIsOn: Bool = false, dueDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date.now) ?? Date.now + (60*60*24), notes: String = "", isCompleted: Bool = false) {
		self.todo = todo
		self.reminderIsOn = reminderIsOn
		self.dueDate = dueDate
		self.notes = notes
		self.isCompleted = isCompleted
	}
}

extension ToDo {	
	static var preview: ModelContainer {
		let container = try! ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
		container.mainContext.insert(ToDo(todo: "Laugh", reminderIsOn: false, dueDate: Date.now, notes: "Anything that makes you laugh.  Maybe funny dog videos.", isCompleted: false))
		container.mainContext.insert(ToDo(todo: "Eat delish food", reminderIsOn: true, dueDate: Date.now + (60*60*24*3), notes: "Only rule is that you have to want the food at the time you're eating it.", isCompleted: true))
		container.mainContext.insert(ToDo(todo: "Read a book you enjoy", reminderIsOn: true, dueDate: Date.now + (60*60*24*10), notes: "Maybe Lady Sherlock", isCompleted: false))
		container.mainContext.insert(ToDo(todo: "Breathe deeply", reminderIsOn: false, dueDate: Date.now, notes: "In a way that feels good", isCompleted: false))
		container.mainContext.insert(ToDo(todo: "Watch a show you like", reminderIsOn: true, dueDate: Date.now + (60*60*24*7), notes: "", isCompleted: false))
		return container
	}
}
