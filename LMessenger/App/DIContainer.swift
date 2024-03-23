//
//  DIContainer.swift
//  LMessenger
//
//  Created by JungWoo Choi on 23/3/2024.
//

import Foundation

class DIContainer: ObservableObject {
  var services: ServiceType
  
  init(services: ServiceType) {
    self.services = services
  }
}
