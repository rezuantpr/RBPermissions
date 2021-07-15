//
//  File.swift
//  
//
//  Created by Rezuan Bidzhiev on 15.07.2021.
//

import Foundation

public enum PermissionType {
  case motion
  case locationInUse
  case locationAlways
  case notifications
}

extension PermissionType {
  var name: String {
    switch self {
    case .motion:
      return "core motion"
    case .locationInUse, .locationAlways:
      return "location"
    case .notifications:
      return "notifications"
    }
  }
}