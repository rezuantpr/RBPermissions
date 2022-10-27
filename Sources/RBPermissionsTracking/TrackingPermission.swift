import Foundation
import RBPermissions
import AppTrackingTransparency

@available(iOS 14.5, *)
public class TrackingPermission: NSObject, Permission {
  public var type: PermissionType = .tracking
  
  public var status: PermissionStatus {
    switch ATTrackingManager.trackingAuthorizationStatus {
    case .authorized: return .authorized
    case .denied: return .denied
    case .notDetermined: return .notDetermined
    case .restricted : return .denied
    @unknown default: return .denied
    }
  }
  
  public func request(completionHandler: (() -> ())?) {
    ATTrackingManager.requestTrackingAuthorization { _ in
      DispatchQueue.main.async {
        completionHandler?()
      }
    }
  }
}

@available(iOS 14.5, *)
extension RBPermissions {
  public static let tracking = TrackingPermission()
}

