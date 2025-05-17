//
//  ToDoListViewReal.swift
//  ToDoList
//
//  Created by Laura Steiner on 5/16/25.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
	
	@State private var sheetIsPresented = false
	@State private var sortSelection: SortOption = .asEntered

	
	var body: some View {
		NavigationStack {
			SortedToDoListView( sortSelection: sortSelection )
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

