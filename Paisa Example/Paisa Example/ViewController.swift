//
//  ViewController.swift
//  Paisa Example
//
//  Created by Niranjan Ravichandran on 3/18/18.
//  Copyright © 2018 Aviato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var walletIcon: UIImageView!
    var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        walletIcon = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 280, height: 220))
        walletIcon.image = #imageLiteral(resourceName: "wallet")
        walletIcon.contentMode = .scaleAspectFit
        walletIcon.center = CGPoint(x: self.view.frame.width/2, y: (self.view.frame.height/2))
        self.view.addSubview(walletIcon)
        
        addButton = UIButton(frame: CGRect.init(x: 0, y: 0, width: 120, height: 40))
        addButton.layer.cornerRadius = 8
        addButton.layer.borderColor = UIColor.gray.cgColor
        addButton.layer.borderWidth = 2
        addButton.clipsToBounds = true
        addButton.setTitle("Add Card", for: .normal)
        addButton.setTitleColor(.gray, for: .normal)
        addButton.center = CGPoint(x: self.view.frame.width/2, y: (self.view.frame.height/2) + 50)
        addButton.alpha = 0
        self.view.addSubview(addButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateKeyframes(withDuration: 1.0, delay: 0, options: UIViewKeyframeAnimationOptions.beginFromCurrentState, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6, animations: {
                self.walletIcon.center.y = (self.view.frame.height/2) - 65
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4, animations: {
                self.addButton.alpha = 1
            })
        }) { (_) in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

