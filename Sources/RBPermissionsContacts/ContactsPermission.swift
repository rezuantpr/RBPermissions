import Foundation
import Contacts
import RBPermissions

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

extension RBPermissions {
  public static let contacts = ContactsPermission()
}
