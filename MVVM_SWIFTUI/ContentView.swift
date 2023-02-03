//
//  ContentView.swift
//  MVVM_SWIFTUI
//
//  Created by Renato on 03/02/23.
//

import SwiftUI

struct ContentView: View {
    private var isLoading = false
    private var message = ""
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(message)
        }
        .padding()
    }
    
    private var loadingOverlay: some View {
        
        Group {
            if isLoading {
                Text("Carregando... ")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
