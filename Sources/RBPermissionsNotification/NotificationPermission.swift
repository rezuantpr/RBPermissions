import Foundation
import UserNotifications
import RBPermissions

public class NotificationPermission: NSObject, Permission {
  public var type: PermissionType { .notifications }
  
  public var status: PermissionStatus {
    guard let authorizationStatus = fetchAuthorizationStatus() else { return .notDetermined }
    switch authorizationStatus {
    case .authorized: return .authorized
    case .denied: return .denied
    case .notDetermined: return .notDetermined
    case .provisional: return .authorized
    case .ephemeral: return .authorized
    @unknown default: return .denied
    }
  }
  
  public func request(completionHandler: (() -> ())?) {
    UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
      DispatchQueue.main.async {
        completionHandler?()
      }
    }
  }
  
  private func fetchAuthorizationStatus() -> UNAuthorizationStatus? {
    var notificationSettings: UNNotificationSettings?
    let semaphore = DispatchSemaphore(value: 0)
    DispatchQueue.global().async {
      UNUserNotificationCenter.current().getNotificationSettings { setttings in
        notificationSettings = setttings
        semaphore.signal()
      }
    }
    semaphore.wait()
    return notificationSettings?.authorizationStatus
  }
}

extension RBPermissions {
  public static let notification = NotificationPermission()
}
