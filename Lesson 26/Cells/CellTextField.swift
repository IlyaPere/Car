//
//  CellTextField.swift
//  Lesson 26
//
//  Created by Илья Петров on 04.04.2021.
//

import UIKit

class CellTextField: UITableViewCell {
    
    static let height: CGFloat = 60
    
    var textField: UITextField!
    
    var lable: UILabel!
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.makeLable()
        self.makeTextField()
        self.selectionStyle = .none
    }
    
    
    func makeLable() {
        let size = CGSize.init(width: UIScreen.main.bounds.width * 0.5, height: CellTextField.height)
        let rect = CGRect.init(origin: .zero, size: size)
        lable = UILabel.init(frame: rect)
        self.contentView.addSubview(lable)
        lable.text = "Model:"
    }
    
    func makeTextField() {
        let size = CGSize.init(width: UIScreen.main.bounds.width * 0.5, height: CellTextField.height)
        let rect = CGRect.init(origin: .zero, size: size)
        textField = UITextField.init(frame: rect)
        self.contentView.addSubview(textField)
        textField.frame.origin.x = UIScreen.main.bounds.width / 2
        textField.placeholder = "Enter Model"
    }
    
}
