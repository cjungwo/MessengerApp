//
//  ContentView.swift
//  LMessenger
//
//

import Foundation
import SwiftUI

struct AuthenticatedView: View {
  @StateObject var authViewModel: AuthenticationViewModel
  @State var isAuthenticated = false
  
    var body: some View {
      Group {
        if isAuthenticated {
          ProfileView()
        } else {
          AuthView()
        }
      }
      .task {
        for await state in await auth.authStateChanges {
          if [.initialSession, .signedIn, .signedOut].contains(state.event) {
            isAuthenticated = state.session != nil
          }
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticatedView(authViewModel: AuthenticationViewModel())
    }
}
