//
//  CreateViewController.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 30/07/21.
//

import Foundation
import UIKit

class CreateController: UIViewController {
    let screenSize = UIScreen.main.bounds
    var create: CreateView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.navigationItem.title = "Criar Quiz"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.purple]
        create = CreateView(frame: screenSize)
        self.view.addSubview(create)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var shouldAutorotate: Bool {
       return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .portrait
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
       return .portrait
    }
    
//    @objc func onClickListener(object : UIButton!) {
//        let createViewController = CreateViewController()
//        self.navigationController?.pushViewController(createViewController, animated: true)
//    }
}
