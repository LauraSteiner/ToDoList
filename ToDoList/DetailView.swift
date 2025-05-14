//
//  DetailView.swift
//  ToDoList
//
//  Created by Laura Steiner on 5/13/25.
//

import SwiftUI

struct DetailView: View {
	var passedValue: String
	
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		ZStack{
			Color.pink.opacity(0.8)
				.ignoresSafeArea(edges: .all)
			VStack {
				
				Image(systemName: "swift")
					.resizable()
					.scaledToFit()
					.foregroundStyle(.orange)
				Text("You are a Swifty legend! And you passed in the value: \(passedValue)")
					.font(.largeTitle)
					.multilineTextAlignment(.center)
				
			}
			.padding()
		}
	}
}

#Preview {
    DetailView(passedValue: "You are awesome!")
}
