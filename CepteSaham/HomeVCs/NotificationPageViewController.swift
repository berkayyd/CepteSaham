//
//  NotificationPageViewController.swift
//  CepteSaham
//
//  Created by Berkay Demir on 1.08.2024.
//

import UIKit

class NotificationPageViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as? NotificationTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}
