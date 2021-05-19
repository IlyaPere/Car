//
//  CellSwitch.swift
//  Lesson 26
//
//  Created by Илья Петров on 04.04.2021.
//

import UIKit

class CellSwitch: UITableViewCell {
    
    static let height: CGFloat = 60
    
    var lable: UILabel!
    
    var swich: UISwitch!
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.makeSwitch()
        self.makeLable()
        self.selectionStyle = .none
    }
    
    func makeLable() {
        let size = CGSize.init(width: UIScreen.main.bounds.width * 0.5, height: CellSwitch.height)
        let rect = CGRect.init(origin: .zero, size: size)
        lable = UILabel.init(frame: rect)
        self.contentView.addSubview(lable)
        lable.text = "New"
    }
    
    
    func makeSwitch() {
        let size = CGSize.init(width: 50, height: 20)
        let rect = CGRect.init(origin: .zero, size: size)
        swich = UISwitch.init(frame: rect)
        swich.frame.origin.x = UIScreen.main.bounds.width - swich.frame.size.width
        swich.center.y = CellSwitch.height / 2
        self.contentView.addSubview(swich)
        
    }
    
}
