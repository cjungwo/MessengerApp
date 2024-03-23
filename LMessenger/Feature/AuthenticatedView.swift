//
//  ContentView.swift
//  LMessenger
//
//

import SwiftUI

struct AuthenticatedView: View {
  @StateObject var authViewModel: AuthenticationViewModel
  
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticatedView(authViewModel: AuthenticationViewModel())
    }
}
