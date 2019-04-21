//
//  ChannelView.swift
//  appChat
//
//  Created by Hoang Anh Tuan on 4/21/19.
//  Copyright © 2019 Hoang Anh Tuan. All rights reserved.
//

import Foundation
import UIKit

protocol ChannelViewDelegate {
    func showLogIn()
}

class ChannelView: UIView {
    let cellId = "cellId"
    
    let channelsLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.contentMode = .left
        lb.text = "CHANNELS"
        return lb
    }()
    
    let addChannelButton: UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(named: "add")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return bt
    }()
    
    let avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .yellow
        return iv
    }()
    
    let loginButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Login", for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        bt.tintColor = .black
        bt.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return bt
    }()
    
    var delegate: ChannelViewDelegate?
    
    @objc func handleLogin() {
        print("touching..")
        delegate?.showLogIn()
    }
    
    let channelTableView: UITableView = {
        let tbv = UITableView(frame: .zero)
        tbv.backgroundColor = .clear
        return tbv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(channelsLabel)
        addSubview(addChannelButton)
        addSubview(avatarImageView)
        addSubview(loginButton)
        addSubview(channelTableView)
        
        channelTableView.dataSource = self
        channelTableView.delegate = self
        channelTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        addChannelButton.anchor(top: topAnchor, paddingtop: 50, left: nil, paddingleft: 0, right: rightAnchor, paddingright: -6, bot: nil, botpadding: 0, height: 50, width: 50)
        channelsLabel.anchor(top: topAnchor, paddingtop: 50, left: leftAnchor, paddingleft: 12, right: addChannelButton.leftAnchor, paddingright: -20, bot: nil, botpadding: 0, height: 50, width: 0)
        avatarImageView.anchor(top: nil, paddingtop: 0, left: leftAnchor, paddingleft: 12, right: nil, paddingright: 0, bot: bottomAnchor, botpadding: -20, height: 100, width: 100)
        avatarImageView.layer.cornerRadius = 50
        
        loginButton.anchor(top: nil, paddingtop: 0, left: avatarImageView.rightAnchor, paddingleft: 15, right: nil, paddingright: 0, bot: nil, botpadding: 0, height: 25, width: 80)
        loginButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
        
        channelTableView.anchor(top: addChannelButton.bottomAnchor, paddingtop: 5, left: leftAnchor, paddingleft: 6, right: rightAnchor, paddingright: 0, bot: avatarImageView.topAnchor, botpadding: -15, height: 0, width: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ChannelView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .clear
        return cell
    }

}
