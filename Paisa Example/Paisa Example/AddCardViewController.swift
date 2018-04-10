//
//  AddCardViewController.swift
//  Paisa Example
//
//  Created by Niranjan Ravichandran on 3/21/18.
//  Copyright © 2018 Aviato. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
