//
//  CreateView.swift
//  quizapp
//
//  Created by Sthefanny Gonzaga on 30/07/21.
//

import Foundation
import UIKit

class CreateView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.buildScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit{
        self.removeFromSuperview()
    }
    
    func buildScreen() {
        self.buildQuizName()
    }
    
    func buildQuizName() {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Teste"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            label.widthAnchor.constraint(equalToConstant: self.frame.width),
            label.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        self.addSubview(label)
        NSLayoutConstraint.activate(constraints)
    }
}
