import Foundation

internal class RSLoadingContainerView: UIView {
  let logger = RSLogger(tag: "RSLoadingContainerView")
  internal var loadingView: RSLoadingView!
  
  deinit {
    logger.logDebug("deinit")
  }
  
  internal init(loadingView: RSLoadingView) {
    self.loadingView = loadingView
    super.init(frame: CGRect.zero)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    self.loadingView = RSLoadingView()
    super.init(coder: aDecoder)
    setup()
  }
  
  fileprivate func setup() {
    logger.logDebug("setup")
    if loadingView.shouldDimBackground {
      backgroundColor = loadingView.dimBackgroundColor
    } else {
      backgroundColor = UIColor.clear
    }
    self.isUserInteractionEnabled = loadingView.isBlocking
    addSubview(loadingView)
    
    loadingView.translatesAutoresizingMaskIntoConstraints = false
    loadingView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    loadingView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    loadingView.widthAnchor.constraint(equalToConstant: loadingView.sizeInContainer.width).isActive = true
    loadingView.heightAnchor.constraint(equalToConstant: loadingView.sizeInContainer.height).isActive = true
  }
  
  internal func free() {
    logger.logDebug("free")
    if let _ = superview { removeFromSuperview() }
    if let loadingView = loadingView { loadingView.removeFromSuperview() }
    loadingView = nil
  }
}
