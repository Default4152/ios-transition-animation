//
//  FriendListTableViewController.swift
//  ios-transition-animation
//
//  Created by Conner on 8/30/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit

class FriendListTableViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }


  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)

    return cell
  }
}
