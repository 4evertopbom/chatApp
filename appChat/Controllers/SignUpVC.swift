//
//  SignUpVC.swift
//  appChat
//
//  Created by Hoang Anh Tuan on 4/21/19.
//  Copyright © 2019 Hoang Anh Tuan. All rights reserved.
//

import Foundation
import UIKit

class SignUpVC: UIViewController {
    
    let logoAppImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "logo")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let dismissButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setImage(UIImage(named: "down")?.withRenderingMode(.alwaysOriginal), for: .normal)
        bt.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return bt
    }()
    
    let descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Get on Cloud"
        lb.textColor = .blue
        lb.textAlignment = .center
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        return lb
    }()
    
    let usernametf: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.placeholder = "username"
        return tf
    }()
    
    let passwordtf: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.placeholder = "password"
        return tf
    }()
    
    let emailtf: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.placeholder = "email"
        return tf
    }()
    
    let signUpButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Sign Up", for: .normal)
        bt.titleLabel?.textColor = .white
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        bt.backgroundColor = .white
        bt.layer.borderColor = UIColor.blue.cgColor
        bt.layer.borderWidth = 1
        bt.clipsToBounds = true
        return bt
    }()
    
    fileprivate func setupTextfields() {
        let stackView = UIStackView(arrangedSubviews: [usernametf,emailtf, passwordtf])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.anchor(top: descriptionLabel.bottomAnchor, paddingtop: 100, left: nil, paddingleft: 0, right: nil, paddingright: 0, bot: nil, botpadding: 0, height: 150, width: 250)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let separateline1 = UIView()
        separateline1.backgroundColor = .blue
        let separateline2 = UIView()
        separateline2.backgroundColor = .blue
        let separateline3 = UIView()
        separateline3.backgroundColor = .blue
        
        stackView.addSubview(separateline1)
        stackView.addSubview(separateline2)
        stackView.addSubview(separateline3)
        separateline1.anchor(top: usernametf.bottomAnchor, paddingtop: 0, left: usernametf.leftAnchor, paddingleft: 0, right: usernametf.rightAnchor, paddingright: 0, bot: nil, botpadding: 0, height: 1, width: 0)
        separateline2.anchor(top: emailtf.bottomAnchor, paddingtop: 0, left: emailtf.leftAnchor, paddingleft: 0, right: passwordtf.rightAnchor, paddingright: 0, bot: nil, botpadding: 0, height: 1, width: 0)
        separateline3.anchor(top: passwordtf.bottomAnchor, paddingtop: 0, left: passwordtf.leftAnchor, paddingleft: 0, right: passwordtf.rightAnchor, paddingright: 0, bot: nil, botpadding: 0, height: 1, width: 0)
    }
    
    @objc func handleDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(dismissButton)
        view.addSubview(descriptionLabel)
        view.addSubview(signUpButton)
        view.addSubview(logoAppImageView)
        
        logoAppImageView.anchor(top: view.topAnchor, paddingtop: 60, left: nil, paddingleft: 0, right: nil, paddingright: 0, bot: nil, botpadding: 0, height: 100, width: 100)
        logoAppImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        dismissButton.anchor(top: view.topAnchor, paddingtop: 20, left: view.leftAnchor, paddingleft: 10, right: nil, paddingright: 0, bot: nil, botpadding: 0, height: 30, width: 30)
        descriptionLabel.anchor(top: logoAppImageView.bottomAnchor, paddingtop: 20, left: nil, paddingleft: 9, right: nil, paddingright: 0, bot: nil, botpadding: 0, height: 30, width: 200)
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        setupTextfields()
        signUpButton.anchor(top: passwordtf.bottomAnchor, paddingtop: 50, left: passwordtf.leftAnchor, paddingleft: 0, right: passwordtf.rightAnchor, paddingright: 0, bot: nil, botpadding: 0, height: 50, width: 0)
        signUpButton.layer.cornerRadius = 20
        
    }
}
