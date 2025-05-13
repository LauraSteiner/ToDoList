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
			VStack {
				NavigationLink {
					DetailView()
				} label: {
					Image(systemName: "eye")
					Text("Show the new View")
				}
				.buttonStyle(.borderedProminent)
				.tint(.pink)
			
			}
			.padding()
		}
    }
}

#Preview {
    ToDoListView()
}
