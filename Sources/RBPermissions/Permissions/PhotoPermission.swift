//
//  File.swift
//  
//
//  Created by Rezuan Bidzhiev on 19.07.2021.
//

import Foundation
import Photos

public class PhotoPermission: NSObject, Permission {
  public var type: PermissionType { .photo }
  
  public var status: PermissionStatus {
    switch PHPhotoLibrary.authorizationStatus() {
    case .authorized: return .authorized
    case .denied: return .denied
    case .notDetermined: return .notDetermined
    case .restricted: return .denied
    case .limited: return .authorized
    @unknown default: return .denied
    }
  }
  
  public func request(completionHandler: (() -> ())?) {
    PHPhotoLibrary.requestAuthorization({
      finished in
      DispatchQueue.main.async {
        completionHandler?()
      }
    })
  }
}
