import Foundation
import CoreMotion
import RBPermissions

public class MotionPermission: NSObject, Permission {
  public var type: PermissionType { .motion }
  
  public var status: PermissionStatus {
    switch CMMotionActivityManager.authorizationStatus() {
    case .authorized: return .authorized
    case .denied: return .denied
    case .notDetermined: return .notDetermined
    case .restricted: return .denied
    @unknown default: return .denied
    }
  }
  
  public func request(completionHandler: (() -> ())?) {
    let manager = CMMotionActivityManager()
    let today = Date()
    
    manager.queryActivityStarting(from: today, to: today, to: OperationQueue.main, withHandler: { (activities: [CMMotionActivity]?, error: Error?) -> () in
        completionHandler?()
        manager.stopActivityUpdates()
    })
  }
}

extension RBPermissions {
  public static let motion = MotionPermission()
}
