//
//  FriendListTableViewController.swift
//  ios-transition-animation
//
//  Created by Conner on 8/30/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit

class FriendListTableViewController: UITableViewController, UIViewControllerTransitioningDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationController?.delegate = navigationControllerDelegate
  }

  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
    
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      segue.destination.transitioningDelegate = self
      if let indexPath = self.tableView.indexPathForSelectedRow {
        self.navigationControllerDelegate.sourceCell = self.tableView.cellForRow(at: indexPath)
      }
  }
  
  let navigationControllerDelegate = NavigationControllerDelegate()
}
