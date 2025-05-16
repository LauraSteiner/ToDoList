//
//  ToDo.swift
//  ToDoList
//
//  Created by Laura Steiner on 5/15/25.
//

import Foundation
import SwiftData

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
