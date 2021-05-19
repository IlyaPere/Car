//
//  CellRating.swift
//  Lesson 26
//
//  Created by Илья Петров on 04.04.2021.
//

import UIKit

class CellRating: UITableViewCell {
    
    
    var lable: UILabel!
    
    var arrayStar = [UIButton]()
    
    
    static let heght: CGFloat = 60
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.makeLable()
        for i in 1 ... 5 {
            self.makeStarButton(tag: i)
        }
        self.selectionStyle = .none
    }
    
    
    func makeLable() {
        let size = CGSize.init(width: UIScreen.main.bounds.width * 0.5, height: CellRating.heght)
        let rect = CGRect.init(origin: .zero, size: size)
        lable = UILabel.init(frame: rect)
        self.contentView.addSubview(lable)
        lable.text = "Rating"
    }
    
    func makeStarButton(tag: Int)  {
        let width = CellRating.heght * 0.7
        let size = CGSize.init(width: width, height: width)
        let rect = CGRect.init(origin: .zero, size: size)
        let button = UIButton.init(frame: rect)
        self.contentView.addSubview(button)
        button.center.y = CellRating.heght * 0.5
        button.setImage("star".getSymbol(), for: .normal)
        
        let distance = UIScreen.main.bounds.width * 0.13
        let firstStarX = UIScreen.main.bounds.width * 0.3
        
        button.center.x = firstStarX + distance * CGFloat(tag - 1)
        button.tag = tag
        arrayStar.append(button)
    }
}
