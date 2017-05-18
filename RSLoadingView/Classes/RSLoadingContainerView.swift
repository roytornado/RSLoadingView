import Foundation

internal class RSLoadingContainerView: UIView {
  internal let loadingView: RSLoadingView
  
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
}
