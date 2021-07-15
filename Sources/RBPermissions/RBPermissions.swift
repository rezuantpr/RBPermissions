//
//  File.swift
//  
//
//  Created by Rezuan Bidzhiev on 15.07.2021.
//

import UIKit
import Foundation

open class RBPermissions {
  public static let motion = MotionPermission()
  public static let locationWhenInUse = LocationWhenInUsePermission()
  public static let locationAlwaysPermission = LocationAlwaysPermission()
  public static let notification = NotificationPermission()
}

public extension RBPermissions {
  private func createAlert(permission: Permission) -> UIAlertController {
    let title = String(format: "%@ are turned off", permission.type.name.capitalized)
    let message = String(format: "Please, visit device Settings to enable %@", permission.type.name.capitalized)
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(.init(title: "Cancel", style: .cancel))
    alertController.addAction(.init(title: "Settings", style: .default, handler: { [weak self]_ in
      self?.openSettings()
    }))
    
    return alertController
  }
  
  private func openSettings() {
    DispatchQueue.main.async {
      guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
        return
      }
      if UIApplication.shared.canOpenURL(settingsUrl) {
        UIApplication.shared.open(settingsUrl, completionHandler: nil)
      }
    }
  }
  
  func presentDeniedAlert(for permission: Permission) {
    let alert = createAlert(permission: permission)
    var rootViewController = UIApplication.shared.keyWindow?.rootViewController
    if let navigationController = rootViewController as? UINavigationController {
        rootViewController = navigationController.viewControllers.first
    }
    if let tabBarController = rootViewController as? UITabBarController {
        rootViewController = tabBarController.selectedViewController
    }
    rootViewController?.present(alert, animated: true, completion: nil)
  }
}
