//
//  FirstViewController.swift
//  Bridge Control
//
//  Created by Victor Smirnov on 08/12/2017.
//  Copyright © 2017 Victor Smirnov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

  @IBOutlet weak var officerLabel: UILabel!
  @IBOutlet weak var authorizationCodeLabel: UILabel!
  @IBOutlet weak var rankLabel: UILabel!
  @IBOutlet weak var warpDriveLabel: UILabel!
  @IBOutlet weak var warpFactorLabel: UILabel!
  @IBOutlet weak var favoriteTeaLabel: UILabel!
  @IBOutlet weak var favoriteCaptainLabel: UILabel!
  @IBOutlet weak var favoriteGadgetLabel: UILabel!
  @IBOutlet weak var favoriteAlienLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    refreshFields()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    NotificationCenter.default.removeObserver(self)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func refreshFields() {
    let defaults = UserDefaults.standard
    officerLabel.text = defaults.string(forKey: officerKey)
    authorizationCodeLabel.text = defaults.string(forKey: authorizationCodeKey)
    rankLabel.text = defaults.string(forKey: rankKey)
    warpDriveLabel.text = defaults.bool(forKey: warpDriveKey) ? "Engaget" : "Disable"
    warpFactorLabel.text = (defaults.object(forKey: warpFactorKey) as AnyObject).stringValue
    favoriteTeaLabel.text = defaults.string(forKey: favoriteTeaKey)
    favoriteCaptainLabel.text = defaults.string(forKey: favoriteCaptainKey)
    favoriteGadgetLabel.text = defaults.string(forKey: favoriteGadgetKey)
    favoriteAlienLabel.text = defaults.string(forKey: favoriteAlienKey)
  }
  
  func applicationWillEnterForeground(notification: NSNotification) {
    let defaults = UserDefaults.standard
    defaults.synchronize()
    refreshFields()
  }

}

