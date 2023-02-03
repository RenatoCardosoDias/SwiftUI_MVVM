//
//  ContentView.swift
//  MVVM_SWIFTUI
//
//  Created by Renato on 03/02/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var model: ContentViewModel
    
    init(model: ContentViewModel) {
        self.model = model
    } //end init
    
    
    var body: some View {
        Text(model.state.isLoading ? "Carregando..." : model.state.message)
            .onAppear(perform: self.model.loadData)
    } //end var body
} //end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView(model: .init(initialState: .init(isLoading: true)))
                .previewDisplayName("Loading")
            ContentView(model: .init(initialState: .init(message: "Sofia Dias")))
                .previewDisplayName("Loaded")
        }
    }
}
