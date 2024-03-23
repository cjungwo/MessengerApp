//
//  ProfileView.swift
//  LMessenger
//
//  Created by JungWoo Choi on 24/3/2024.
//

import Foundation
import SwiftUI
import Supabase

struct ProfileView: View {
  @State var username = ""
  @State var fullName = ""
  @State var website = ""
  
  @State var isLoading = false
  
  var body: some View {
    NavigationStack {
      Form {
        Section {
          TextField("Username", text: $username)
            .textContentType(.username)
            .textInputAutocapitalization(.never)
          
          TextField("Full Name", text: $fullName)
            .textContentType(.name)
          
          TextField("Website", text: $website)
            .textContentType(.URL)
            .textInputAutocapitalization(.never)
        }
        
        Section {
          Button("Update profile") {
            updateProfileButtonTapped()
          }
          .bold()
          
          if isLoading {
            ProgressView()
          }
        }
      }
      .navigationTitle("Profile")
      .toolbar(content: {
        ToolbarItem(placement: .topBarLeading) {
          Button("Sign out", role: .destructive) {
            Task {
              try? await auth.signOut()
            }
          }
        }
      })
    }
    .task {
      await getInitialProfile()
    }
  }
  
  func getInitialProfile() async {
    do {
      let currentUser = try await auth.session.user
      
      let profile: Profile = try await supabase.database
        .from("profiles")
        .select()
        .eq("id", value: currentUser.id)
        .single()
        .execute()
        .value
      
      self.username = profile.username ?? ""
      self.fullName = profile.fullName ?? ""
      self.website = profile.website ?? ""
    } catch {
      debugPrint(error)
    }
  }
  
  func updateProfileButtonTapped() {
    Task {
      isLoading = true
      defer { isLoading = false }
      
      do {
        let currentUser = try await auth.session.user
        
        try await supabase.database
          .from("profiles")
          .update(
            UpdateProfileParams(
              username: username,
              fullName: fullName,
              website: website
            )
          )
          .eq("id", value: currentUser.id)
          .execute()
      } catch {
        debugPrint(error)
      }
    }
  }
}

#Preview {
  ProfileView()
}
