import UIKit
import RSLoadingView

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func showOnView() {
    let loadingView = RSLoadingView()
    loadingView.shouldTapToDismiss = true
    loadingView.show(on: view)
  }
  
  @IBAction func showOnViewTwins() {
    let loadingView = RSLoadingView(effectType: RSLoadingView.Effect.twins)
    loadingView.shouldTapToDismiss = true
    loadingView.show(on: view)
  }
  
  @IBAction func showOnWindow() {
    RSLoadingView.hideFromKeyWindow()
    /*
    let loadingView = RSLoadingView()
    loadingView.shouldTapToDismiss = true
    loadingView.variantKey = "inAndOut"
    loadingView.speedFactor = 2.0
    loadingView.lifeSpanFactor = 2.0
    loadingView.mainColor = UIColor.white
    loadingView.showOnKeyWindow()*/
  }
}

