//
//  HomeView.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 30/07/21.
//

import Foundation
import UIKit

class HomeView: UIView {
    var createButtonConstraints: [NSLayoutConstraint]?
    var playButtonConstraints: [NSLayoutConstraint]?
    var createButton: UIButton?
    var playButton: UIButton?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.buildHomeScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit{
        self.removeFromSuperview()
    }
    
    func buildHomeScreen() {
        self.buildTitle()
        self.buildButtons()
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func buildTitle() {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Quizator"
        label.font = UIFont(name: "Futura-Bold", size: 60)
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            label.widthAnchor.constraint(equalToConstant: self.frame.width),
            label.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        self.addSubview(label)
        NSLayoutConstraint.activate(constraints)
    }
    
    func buildButtons() {
        createButton = buildCreateButton()
        playButton = buildPlayButton()
        
        self.addSubview(createButton!)
        self.addSubview(playButton!)
        
        NSLayoutConstraint.activate(createButtonConstraints!)
        NSLayoutConstraint.activate(playButtonConstraints!)
    }
    
    func buildCreateButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Criar Quiz", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura", size: 20)
        button.addTarget(self.parentFocusEnvironment, action: #selector(HomeController.onClickListener(object:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        createButtonConstraints = [
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        
        return button
    }
    
    func buildPlayButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Jogar Quiz", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura", size: 20)
        button.addTarget(self, action: #selector(self.playButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        playButtonConstraints = [
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: self.createButton!.center.y + 100),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        return button
    }
    
    @objc func playButtonAction(_ sender:UIButton!)
    {
        print("Play Button tapped")
    }
    
    func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
