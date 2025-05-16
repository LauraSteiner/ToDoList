//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Laura Steiner on 5/13/25.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
				.modelContainer(for: ToDo.self)
        }
    }
	
	init(){
		print("URL for database")
		print(URL.applicationSupportDirectory.path(percentEncoded: false))
	}
}
