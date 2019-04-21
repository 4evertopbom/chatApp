//
//  ViewController.swift
//  appChat
//
//  Created by Hoang Anh Tuan on 4/19/19.
//  Copyright © 2019 Hoang Anh Tuan. All rights reserved.
//

import UIKit

class ChatController: UIViewController, ChannelViewDelegate {
    func showLogIn() {
        let vc = LoginVC()
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                let width = window.frame.width * 3 / 4
                self.channelView.frame = CGRect(x: -width, y: 0, width: width, height: window.frame.height)
            }
        }
        UIView.animate(withDuration: 0.5) {
            self.present(vc, animated: true, completion: nil)
        }
    }
    

    let channelView: ChannelView = {
        let vc = ChannelView()
        return vc
    }()
    
    let button: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.setGradientBackground(colorOne: UIColor.yellow, colorTwo: UIColor.green)
     //   navigationController!.navigationBar.s
        
        navigationItem.title = "Smack"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "list")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleOpenChannelVC))
    }
    
    let blackView = UIView()
    
    @objc func handleOpenChannelVC() {
        if let window = UIApplication.shared.keyWindow {

            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            window.addSubview(blackView)
            window.addSubview(channelView)
            
            DispatchQueue.main.async {
                self.channelView.setGradientBackground(colorOne: UIColor.yellow, colorTwo: UIColor.green)
                self.channelView.delegate = self
            }
        
            let width = window.frame.width * 3 / 4
            channelView.frame = CGRect(x: -width, y: 0, width: width, height: window.frame.height)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            blackView.frame = window.frame
            blackView.alpha = 0

            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.channelView.frame = CGRect(x: 0, y: 0, width: width, height: window.frame.height)
            }, completion: nil)
        }
    }
    
    @objc func handleDismiss() {
        print("touching blackView...")
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                let width = window.frame.width * 3 / 4
                self.channelView.frame = CGRect(x: -width, y: 0, width: width, height: window.frame.height)
            }
        }
    }
    
}

