import Foundation
import SceneKit

public class RSLoadingTwins: RSLoadingViewEffect {
  
  enum TwinsVariants: String {
    case base
  }
  
  let nameParticleSystem = "Twins"
  let nameParticleImage = "SpinAlone"
  var variant = TwinsVariants.base
  var dot1Node: SCNNode!
  var dot2Node: SCNNode!
  
  func setup(main: RSLoadingView) {
    dot1Node = SCNNode(geometry: SCNSphere(radius: 0.1))
    dot2Node = SCNNode(geometry: SCNSphere(radius: 0.1))
    
    for dotNode in [dot1Node!, dot2Node!] {
      dotNode.geometry?.firstMaterial?.diffuse.contents = UIColor.clear
      main.scene.rootNode.addChildNode(dotNode)
      if let particleSystem = main.loadParticleSystem(name: nameParticleSystem) {
        if let image = main.loadParticleImage(name: nameParticleImage) {
          particleSystem.particleImage = image
        }
        dotNode.addParticleSystem(particleSystem)
      }
    }
  }
  
  func prepareForResize(main: RSLoadingView) {
    let radius = main.widthInUnit.quarter
    dot1Node.pivot = SCNMatrix4MakeTranslation(0, radius, 0)
    dot2Node.pivot = SCNMatrix4MakeTranslation(0, -radius, 0)
    
    if let variant = TwinsVariants(rawValue: main.variantKey) {
      self.variant = variant
    }
    for dotNode in [dot1Node!, dot2Node!] {
      if let particleSystem = dotNode.particleSystems?.first {
        particleSystem.particleSize = particleSystem.particleSize * main.sizeFactor
        particleSystem.particleColor = main.mainColor
        particleSystem.particleColorVariation = SCNVector4Make(main.colorVariation.asFloat, 0, 0, 0)
        particleSystem.particleLifeSpan = particleSystem.particleLifeSpan * main.lifeSpanFactor
        particleSystem.spreadingAngle = particleSystem.spreadingAngle * main.spreadingFactor
      }
      dotNode.removeAllActions()
      let angle: CGFloat = -180 * main.speedFactor
      dotNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 0, z: angle.degreesToRadians, duration: 1.0)))
    }
  }
  
  func update(at time: TimeInterval) {
  }
}
