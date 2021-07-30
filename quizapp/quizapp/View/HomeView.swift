//
//  HomeView.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 30/07/21.
//

//import Foundation
//import UIKit
//
//class HomeView: UIView {
//    let screenSize: CGRect = UIScreen.main.bounds
//    
//    override init(frame: CGRect){
//        
//        super.init(frame: screenSize)
//        self.buildTitle()
//        self.buildButtons()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    deinit{
//        self.removeFromSuperview()
//    }
//    
//    func buildTitle() {
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 100))
//        label.center = CGPoint(x: self.center.x, y: 200)
//        label.textAlignment = .center
//        label.text = "Quizator"
//        label.font = UIFont(name: "Futura-Bold", size: 60)
//        label.textColor = .purple
//    }
//    
//    func buildButtons() {
//        let createButton = buildCreateButton()
////        let playButton = buildPlayButton()
////
////        playButton.center = CGPoint(x: createButton.center.x, y: self.center.y + 100)
//        
//    }
//    
//    func buildCreateButton() {
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
//        button.center = CGPoint(x: self.center.x, y: self.center.y)
//        button.backgroundColor = .purple
//        button.layer.cornerRadius = 5
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor.black.cgColor
//        button.setTitle("Criar Quiz", for: .normal)
//        button.titleLabel?.font = UIFont(name: "Futura", size: 20)
//        button.addTarget(self, action: #selector(HomeController.onClickListener(object:)), for: .touchUpInside)
//    }
//    
////    func buildPlayButton() -> UIButton {
////        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
////        button.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
////        button.backgroundColor = .purple
////        button.layer.cornerRadius = 5
////        button.layer.borderWidth = 1
////        button.layer.borderColor = UIColor.black.cgColor
////        button.setTitle("Jogar Quiz", for: .normal)
////        button.titleLabel?.font = UIFont(name: "Futura", size: 20)
////        button.addTarget(self, action: #selector(self.playButtonAction), for: .touchUpInside)
////        return button
////    }
//}
