//
//  ViewController.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 28/07/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var screenView: UIView!
    //    @IBOutlet weak var playButton: UIButton!
//    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buildHomeScreen()
    }
    
    func buildHomeScreen() {
//        let constraints = [
//            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor),
//        ]
        
//        NSLayoutConstraint.activate(constraints)
        
        self.buildTitle()
        self.buildButtons()
        
        
        
        
    }
    
    func buildTitle() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        label.center = CGPoint(x: self.view.center.x, y: 200)
        label.textAlignment = .center
        label.text = "Quizator"
        label.font = UIFont(name: "Futura-Bold", size: 60)
        label.textColor = .purple
        self.view.addSubview(label)
    }
    
    func buildButtons() {
        let createButton = buildCreateButton()
        let playButton = buildPlayButton()
        
        playButton.center = CGPoint(x: createButton.center.x, y: self.view.center.y + 100)
        
        self.view.addSubview(createButton)
        self.view.addSubview(playButton)
    }
    
    func buildCreateButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        button.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Criar Quiz", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura", size: 20)
        button.addTarget(self, action: #selector(self.createButtonAction), for: .touchUpInside)
        return button
    }
    
    func buildPlayButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        button.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Jogar Quiz", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura", size: 20)
        button.addTarget(self, action: #selector(self.playButtonAction), for: .touchUpInside)
        return button
    }
    
    @objc func createButtonAction(_ sender:UIButton!)
    {
        print("Create Button tapped")
    }
    
    @objc func playButtonAction(_ sender:UIButton!)
    {
        print("Play Button tapped")
    }

}

