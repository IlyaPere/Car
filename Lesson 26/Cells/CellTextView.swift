//
//  CellTextView.swift
//  Lesson 26
//
//  Created by Илья Петров on 04.04.2021.
//

import UIKit

class CellTextView: UITableViewCell {
    
    static let hight: CGFloat = 300
    
    var textView: UITextView!
    
    var lable: UILabel!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.makeLable()
        self.makeTextView()
        self.selectionStyle = .none
    }
    
    func makeLable() {
        let size = CGSize.init(width: UIScreen.main.bounds.width, height: 30)
        let rect = CGRect.init(origin: .zero, size: size)
        lable = UILabel.init(frame: rect)
        self.contentView.addSubview(lable)
        lable.text = "Description:"
    }
    
    func makeTextView() {
        let size = CGSize.init(width: UIScreen.main.bounds.width, height: CellTextView.hight - lable.frame.size.height)
        let rect = CGRect.init(origin: .zero, size: size)
        textView = UITextView.init(frame: rect)
        self.contentView.addSubview(textView)
        textView.frame.origin.y = lable.frame.size.height
    }
    
}
