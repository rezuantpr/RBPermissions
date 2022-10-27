public enum PermissionType {
  case motion
  case locationInUse
  case locationAlways
  case notifications
  case camera
  case photo
  case contacts
  case tracking
}

extension PermissionType {
  var name: String {
    switch self {
    case .motion:
      return "core motion"
    case .locationInUse, .locationAlways:
      return "location"
    case .notifications:
      return "notifications"
    case .camera:
      return "camera"
    case .photo:
      return "photo"
    case .contacts:
      return "contacts"
    case .tracking:
      return "tracking"
    }
  }
}
