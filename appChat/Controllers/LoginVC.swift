//
//  LoginVC.swift
//  appChat
//
//  Created by Hoang Anh Tuan on 4/21/19.
//  Copyright © 2019 Hoang Anh Tuan. All rights reserved.
//

import Foundation
import UIKit

class LoginVC: UIViewController {
    
    let dismissButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setImage(UIImage(named: "down")?.withRenderingMode(.alwaysOriginal), for: .normal)
        bt.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return bt
    }()
    
    let logoAppImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "logo")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    @objc func handleDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
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
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let signinButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Button", for: .normal)
        bt.titleLabel?.textColor = .white
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        bt.backgroundColor = .white
        bt.layer.borderColor = UIColor.blue.cgColor
        bt.layer.borderWidth = 1
        bt.clipsToBounds = true
        return bt
    }()
    
    let registerButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Register Here", for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        bt.titleLabel?.tintColor = .gray
        bt.contentMode = .center
        bt.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return bt
    }()
    
    @objc func handleSignUp() {
        let vc = SignUpVC()
        self.present(vc, animated: true, completion: nil)
    }
    
    fileprivate func setupTextfields() {
        let stackView = UIStackView(arrangedSubviews: [usernametf, passwordtf])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.anchor(top: logoAppImageView.bottomAnchor, paddingtop: 100, left: nil, paddingleft: 0, right: nil, paddingright: 0, bot: nil, botpadding: 0, height: 100, width: 250)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let separateline1 = UIView()
        separateline1.backgroundColor = .blue
        let separateline2 = UIView()
        separateline2.backgroundColor = .blue
        
        stackView.addSubview(separateline1)
        stackView.addSubview(separateline2)
        separateline1.anchor(top: usernametf.bottomAnchor, paddingtop: 0, left: usernametf.leftAnchor, paddingleft: 0, right: usernametf.rightAnchor, paddingright: 0, bot: nil, botpadding: 0, height: 1, width: 0)
        separateline2.anchor(top: passwordtf.bottomAnchor, paddingtop: 0, left: passwordtf.leftAnchor, paddingleft: 0, right: passwordtf.rightAnchor, paddingright: 0, bot: nil, botpadding: 0, height: 1, width: 0)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(dismissButton)
        view.addSubview(logoAppImageView)
        view.addSubview(signinButton)
        view.addSubview(registerButton)
        
        dismissButton.anchor(top: view.topAnchor, paddingtop: 20, left: view.leftAnchor, paddingleft: 10, right: nil, paddingright: 0, bot: nil, botpadding: 0, height: 30, width: 30)
        logoAppImageView.anchor(top: view.topAnchor, paddingtop: 60, left: nil, paddingleft: 0, right: nil, paddingright: 0, bot: nil, botpadding: 0, height: 100, width: 100)
        logoAppImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        setupTextfields()
        signinButton.anchor(top: passwordtf.bottomAnchor, paddingtop: 50, left: passwordtf.leftAnchor, paddingleft: 0, right: passwordtf.rightAnchor, paddingright: 0, bot: nil, botpadding: 0, height: 50, width: 0)
        signinButton.layer.cornerRadius = 20
        registerButton.anchor(top: signinButton.bottomAnchor, paddingtop: 20, left: signinButton.leftAnchor, paddingleft: 0, right: signinButton.rightAnchor, paddingright: 0, bot: nil, botpadding: 0, height: 15, width: 0)
    }
    
    
}
