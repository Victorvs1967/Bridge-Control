//
//  SecondViewController.swift
//  Bridge Control
//
//  Created by Victor Smirnov on 08/12/2017.
//  Copyright © 2017 Victor Smirnov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  @IBOutlet weak var engineSwitch: UISwitch!
  @IBOutlet weak var warpFactorSlider: UISlider!
  
  @IBAction func onEngineSwitchTapped(_ sender: UISwitch) {
    let defaults = UserDefaults.standard
    defaults.set(engineSwitch.isOn, forKey: warpDriveKey)
    defaults.synchronize()
  }
  @IBAction func onWarpSliderDragged(_ sender: UISlider) {
    let defaults = UserDefaults.standard
    defaults.set(warpFactorSlider.value, forKey: warpFactorKey)
    defaults.synchronize()
  }
  @IBAction func onSettingButtonTapped(_ sender: UIButton) {
    let app = UIApplication.shared
    let url = URL(string: UIApplicationOpenSettingsURLString)! as URL
    if app.canOpenURL(url) {
      app.open(url, options: ["":""], completionHandler: nil)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    let app = UIApplication.shared
    NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground(notification:)), name: NSNotification.Name.UIApplicationWillEnterForeground, object: app)
    
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
    engineSwitch.isOn = defaults.bool(forKey: warpDriveKey)
    warpFactorSlider.value = defaults.float(forKey: warpFactorKey)
  }

  @objc func applicationWillEnterForeground(notification: NSNotification) {
    let defaults = UserDefaults.standard
    defaults.synchronize()
    refreshFields()
  }

}

