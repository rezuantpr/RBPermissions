public protocol Permission {
  var authorized: Bool { get }
  var denied: Bool { get }
  
  var type: PermissionType { get }
  var status: PermissionStatus { get }
  func request(completionHandler: (() -> ())?)
}

extension Permission {
  public var authorized: Bool { status == .authorized }
  public var denied: Bool { status == .denied }
}
