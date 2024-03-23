//
//  LMessengerApp.swift
//  LMessenger
//
//

import SwiftUI

@main
struct LMessengerApp: App {
  @State var container: DIContainer = .init(services: Service())
  
    var body: some Scene {
        WindowGroup {
            AuthenticatedView(authViewModel: AuthenticationViewModel())
            .environmentObject(container)
        }
    }
}
