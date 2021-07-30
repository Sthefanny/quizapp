//
//  CreateViewController.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 30/07/21.
//

import Foundation
import UIKit

class CreateViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        label.center = CGPoint(x: self.view.center.x, y: 200)
        label.textAlignment = .center
        label.text = "TESTE"
        label.font = UIFont(name: "Futura-Bold", size: 60)
        label.textColor = .purple
        self.view.addSubview(label)
    }
}
