//
//  File.swift
//  
//
//  Created by Rezuan Bidzhiev on 15.07.2021.
//

import Foundation
import CoreLocation

public class LocationAlwaysPermission: NSObject, Permission {
  public var type: PermissionType { .locationAlways}
  
  public var status: PermissionStatus {
    let authorizationStatus: CLAuthorizationStatus = {
      if #available(iOS 14.0, tvOS 14.0, *) {
        return CLLocationManager().authorizationStatus
      } else {
        return CLLocationManager.authorizationStatus()
      }
    }()
    
    switch authorizationStatus {
    case .authorized: return .authorized
    case .denied: return .denied
    case .notDetermined: return .notDetermined
    case .restricted: return .denied
    case .authorizedAlways: return .authorized
    case .authorizedWhenInUse: return .denied
    @unknown default: return .denied
    }
  }
  
  public func request(completionHandler: (() -> ())?) {
    self.completionHandler = completionHandler
    
    let status = CLLocationManager.authorizationStatus()
    
    switch status {
    case .notDetermined:
      locationManager.delegate = self
      locationManager.requestAlwaysAuthorization()
    case .authorizedWhenInUse:
      locationManager.delegate = self
      locationManager.requestAlwaysAuthorization()
    default:
      self.completionHandler?()
    }
  }
  
  var completionHandler: (() -> ())?
  
  private lazy var locationManager = CLLocationManager()
  
  deinit {
    locationManager.delegate = nil
  }
}

extension LocationAlwaysPermission: CLLocationManagerDelegate {
  public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    if status == .notDetermined {
      return
    }
    DispatchQueue.main.async {
      self.completionHandler?()
    }
  }
}
