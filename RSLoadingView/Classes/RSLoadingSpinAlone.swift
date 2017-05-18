import Foundation
import SceneKit

public class RSLoadingSpinAlone: RSLoadingViewEffect {
  
  enum SpinAloneVariants: String {
    case base, inAndOut
  }
  
  let nameParticleSystem = "SpinAlone"
  let nameParticleImage = "SpinAlone"
  var variant = SpinAloneVariants.base
  var dotNode: SCNNode!
  var maxRadius: Float = 0
  var currentRadius: Float = 0
  var radiusFactor: Float = -1
  
  func setup(main: RSLoadingView) {
    dotNode = SCNNode(geometry: SCNSphere(radius: 0.1))
    dotNode.geometry?.firstMaterial?.diffuse.contents = UIColor.clear
    main.scene.rootNode.addChildNode(dotNode)
    if let particleSystem = main.loadParticleSystem(name: nameParticleSystem) {
      if let image = main.loadParticleImage(name: nameParticleImage) {
        particleSystem.particleImage = image
      }
      dotNode.addParticleSystem(particleSystem)
    }
  }
  
  func prepareForResize(main: RSLoadingView) {
    maxRadius = main.widthInUnit.quarter
    currentRadius = maxRadius
    dotNode.pivot = SCNMatrix4MakeTranslation(0, currentRadius, 0)
    
    if let variant = SpinAloneVariants(rawValue: main.variantKey) {
      self.variant = variant
    }
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
  
  func update(at time: TimeInterval) {
    if variant == .inAndOut {
      let minRadius = maxRadius * 0.4
      let step = maxRadius / 1000
      currentRadius += step * radiusFactor
      if currentRadius <= minRadius {
        radiusFactor = 1
      } else if currentRadius >= maxRadius  {
        radiusFactor = -1
      }
      dotNode.pivot = SCNMatrix4MakeTranslation(0, currentRadius, 0)
    }
  }
}
