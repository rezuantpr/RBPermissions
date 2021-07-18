import Foundation
import AVFoundation

public class CameraPermission: NSObject, Permission {
  public var type: PermissionType { .camera }
  
  public var status: PermissionStatus {
    switch AVCaptureDevice.authorizationStatus(for: .video) {
    case .authorized: return .authorized
    case .denied: return .denied
    case .notDetermined: return .notDetermined
    case .restricted: return .denied
    @unknown default: return .denied
    }
  }
  
  public func request(completionHandler: (() -> ())?) {
    AVCaptureDevice.requestAccess(for: .video, completionHandler: {
      finished in
      DispatchQueue.main.async {
        completionHandler?()
      }
    })
  }
  
}
