//
//  DetailView.swift
//  ToDoList
//
//  Created by Laura Steiner on 5/13/25.
//

import SwiftUI

struct DetailView: View {
	@Environment(\.dismiss) var dismiss
	
    var body: some View {
		
		VStack {
			Image(systemName: "swift")
				.resizable()
				.scaledToFit()
				.foregroundStyle(.orange)
			Text("You are a Swifty legend!")
				.font(.largeTitle)
				.multilineTextAlignment(.center)
			
			Button("Get Back!") {
				dismiss()
			}
			.buttonStyle(.bordered)
			
		}
		.padding()
		.navigationBarBackButtonHidden()
    }
}

#Preview {
    DetailView()
}
