import Foundation
import SceneKit

public class RSLogger {
  var tag: String
  open var enabled = false
  
  init(tag: String) {
    self.tag = tag
  }
  
  public func logDebug(_ msg: String) {
    if !enabled {
      return
    }
    let df = DateFormatter()
    df.dateStyle = .short
    df.timeStyle = .short
    print("[\(tag)] \(df.string(from: Date())): \(msg)")
  }
}

extension Int {
  var degreesToRadians: Double { return Double(self) * .pi / 180 }
}

extension FloatingPoint {
  var degreesToRadians: Self { return self * .pi / 180 }
  var radiansToDegrees: Self { return self * 180 / .pi }
  var double: Self { return self * 2 }
  var half: Self { return self / 2 }
  var quarter: Self { return self / 4 }
}

extension CGFloat {
  var asFloat: Float { return Float(self) }
  var asDouble: Double { return Double(self) }
  var asInt: Int { return Int(self) }
}

extension Float {
  var asCGFloat: CGFloat { return CGFloat(self) }
  var asDouble: Double { return Double(self) }
  var asInt: Int { return Int(self) }
}
