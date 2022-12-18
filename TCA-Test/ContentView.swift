//
//  ContentView.swift
//  TCA-Test
//
//  Created by Elliot Knight on 18/12/2022.
//

import SwiftUI
import ComposableArchitecture

struct State: Equatable {
	var counter = 0
}

enum Action: Equatable {
	case increaseCounter, deacraseCounter
}

struct Environment {
	// Future dependencies
}

let reducer = Reducer<State, Action, Environment> { state, action, environment in
	switch action {
	case .increaseCounter:
		state.counter += 1
		return Effect.none
	case .deacraseCounter:
		state.counter -= 1
		return Effect.none
	}
}

struct ContentView: View {
	let store: Store<State, Action>

	var body: some View {
		WithViewStore(self.store) { viewStore in

			HStack {
				Button {
					viewStore.send(.deacraseCounter)
				} label: {
					Image(systemName: "minus")
				}

				Text(viewStore.state.counter.description)

				Button {
					viewStore.send(.increaseCounter)
				} label: {
					Image(systemName: "plus")
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(
			store: Store(
				initialState: State(),
				reducer: reducer,
				environment: Environment())
		)
	}
}
