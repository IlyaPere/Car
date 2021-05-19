//
//  CellPhoto.swift
//  Lesson 26
//
//  Created by Илья Петров on 04.04.2021.
//

import UIKit

class CellPhoto: UITableViewCell {
    
    static let height: CGFloat = 200
    
    var photoView: UIImageView!
    
    var buttonCamera: UIButton!
    
    var buttonLibrary: UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.makePhotoView()
        self.makeButtonCamera()
        self.makeButtonLibrary()
        self.selectionStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makePhotoView() {
        let size = CGSize.init(width: CellPhoto.height, height: CellPhoto.height)
        let rect = CGRect.init(origin: .zero, size: size)
        photoView = UIImageView.init(frame: rect)
        self.contentView.addSubview(photoView)
        self.photoView.backgroundColor = UIColor.init(red: 0.90, green: 0.92, blue: 0.95, alpha: 1)
        photoView.center.x = UIScreen.main.bounds.width * 0.5
    }
  
    
    func makeButtonCamera() {
        let size = CGSize.init(width: 70, height: 70)
        let rect = CGRect.init(origin: .zero, size: size)
        buttonCamera = UIButton.init(frame: rect)
        self.contentView.addSubview(buttonCamera)
        let image = "camera".getSymbol()
        buttonCamera.setImage(image, for: .normal)
        buttonCamera.center.y = CellPhoto.height / 2
        buttonCamera.center.x = photoView.frame.origin.x / 2
        
        
    }
    
    func makeButtonLibrary() {
        let size = CGSize.init(width: 70, height: 70)
        let rect = CGRect.init(origin: .zero, size: size)
        buttonLibrary = UIButton.init(frame: rect)
        self.contentView.addSubview(buttonLibrary)
        let image = "photo.on.rectangle.angled".getSymbol()
        buttonLibrary.setImage(image, for: .normal)
        buttonLibrary.center.y = CellPhoto.height / 2
        buttonLibrary.center.x = UIScreen.main.bounds.width - buttonCamera.center.x
    }
    
    
}


