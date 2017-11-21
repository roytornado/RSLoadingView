import UIKit
import RSLoadingView

class TableViewDemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet weak var tableView: UITableView!
  var count = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    demoLoading()
  }
  
  func demoLoading() {
    let loadingView = RSLoadingView()
    loadingView.shouldDimBackground = false
    loadingView.mainColor = UIColor.darkGray
    loadingView.show(on: tableView)
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
      self.count = 30
      self.tableView.reloadData()
      loadingView.hide()
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
    cell.textLabel?.text = "Row \(indexPath.row)"
    return cell
  }
  
  @IBAction func close() {
    dismiss(animated: true, completion: nil)
  }
}

