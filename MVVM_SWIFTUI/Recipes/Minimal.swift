//
//  Minimal.swift
//  MVVM_SWIFTUI
//
//  Created by Renato on 03/02/23.
//

import SwiftUI

struct ContentViewState {
    var isLoading = false
    var message = ""
}

class ContentViewModel: ObservableObject {
    @Published private(set) var state: ContentViewState
    
    init(initialState: ContentViewState = .init()){
        state = initialState
    } //end init
    
    func loadData(){
        state.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.state.isLoading = false
            self.state.message = "Renato Dias"
        } //end Dispatch
    } //end private func loadData
    
} //end class ContentViewModel
