//
//  ViewController.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 28/07/21.
//

import UIKit

class HomeController: UIViewController {
    let screenSize = UIScreen.main.bounds
    var home: HomeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        home = HomeView(frame: screenSize)
        self.view.addSubview(home)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
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
    
    @objc func onClickListener(object : UIButton!) {
        let createViewController = CreateController()
        self.navigationController?.pushViewController(createViewController, animated: true)
    }
}

