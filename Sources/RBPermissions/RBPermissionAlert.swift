import UIKit

public class RBPermissionAlert: UIAlertController {
  
  private lazy var alertWindow: UIWindow = {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = RBAlertViewController()
    window.backgroundColor = .clear
    window.windowLevel = .alert
    return window
  }()
  
  public func show(animated: Bool = true, completion: (() -> Void)? = nil) {
    if let rootViewController = alertWindow.rootViewController {
      alertWindow.makeKeyAndVisible()
    
      rootViewController.present(self, animated: animated, completion: completion)
    }
  }
}

private class RBAlertViewController: UIViewController {
  public override var preferredStatusBarStyle: UIStatusBarStyle {
    UIApplication.shared.statusBarStyle
  }

  public override var prefersStatusBarHidden: Bool {
    UIApplication.shared.isStatusBarHidden
  }
}
