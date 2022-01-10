import UIKit

open class RBPermissions {
}

public extension RBPermissions {
  static private func createAlert(permission: Permission) -> RBPermissionAlert {
    let title = String(format: "%@ are turned off", permission.type.name.capitalized)
    let message = String(format: "Please, visit device Settings to enable %@", permission.type.name.capitalized)
    let alertController = RBPermissionAlert(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(.init(title: "Cancel", style: .cancel))
    alertController.addAction(.init(title: "Settings", style: .default, handler: { _ in
      openSettings()
    }))
    
    return alertController
  }
  
  static private func openSettings() {
    DispatchQueue.main.async {
      guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
        return
      }
      if UIApplication.shared.canOpenURL(settingsUrl) {
        UIApplication.shared.open(settingsUrl, completionHandler: nil)
      }
    }
  }
  
  static func presentDeniedAlert(for permission: Permission) {
    let alert = createAlert(permission: permission)
    alert.show(animated: true, completion: nil)
  }
}
