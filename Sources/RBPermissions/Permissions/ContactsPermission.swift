//
//  File.swift
//  
//
//  Created by Rezuan Bidzhiev on 04.11.2021.
//

import Foundation
import Contacts

public class ContactsPermission: NSObject, Permission {

  public let type: PermissionType = .contacts
  
  public var status: PermissionStatus {
    switch CNContactStore.authorizationStatus(for: .contacts) {
    case .authorized: return .authorized
    case .denied: return .denied
    case .notDetermined: return .notDetermined
    case .restricted: return .denied
    @unknown default: return .denied
    }
  }
  
  public func request(completionHandler: (() -> ())?) {
    let store = CNContactStore()
    store.requestAccess(for: .contacts, completionHandler: { (granted, error) in
      DispatchQueue.main.async {
        completionHandler?()
      }
    })
  }
}
