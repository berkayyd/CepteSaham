import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    
    var profileOptions: [ProfileOption] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the data source
        profileOptions = [
            ProfileOption(text: "History", imageName: "history-icon"),
            ProfileOption(text: "Personal Detailes", imageName: "personalDetailes-icon"),
            ProfileOption(text: "Location", imageName: "location-icon"),
            ProfileOption(text: "Payment Method", imageName: "payment-icon"),
            ProfileOption(text: "Settings", imageName: "settings-icon"),
            ProfileOption(text: "Help", imageName: "help-icon"),
            ProfileOption(text: "Logout", imageName: "logout-icon")
        ]
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableHeaderView = headerView
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as? ProfileTableViewCell else {
            return UITableViewCell()
        }
        
        let option = profileOptions[indexPath.row]
        cell.optionLabel.text = option.text
        cell.optionImageView.image = UIImage(named: option.imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}
