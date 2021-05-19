//
//  CellCar.swift
//  Lesson 26
//
//  Created by Илья Петров on 14.05.2021.
//

import UIKit

class CellCar: UITableViewCell {
    
    static var heightCell: CGFloat = 30 * 11
    
    private let heightLine: CGFloat = 30
    private var heightImageView: CGFloat {
        let height = heightLine * 5
        return height
    }
    private var widthLable: CGFloat {
        let widht = (UIScreen.main.bounds.width - offsetX * 2) / 2
        return widht
    }
    private let offsetX: CGFloat = 20
    
    
    var imgView: UIImageView!
    
    private var lableModel: UILabel!
    var lableModelValue: UILabel!
    
    private var lableIsNew: UILabel!
    var lableIsNewValue: UILabel!
    
    private  var lableRating: UILabel!
    var starsImageViews = [UIImageView]()
    
    private var lableDescription: UILabel!
    var lableDescriptionValue: UILabel!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configuration()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: -Configuration-
extension CellCar {
    
    private func configuration() {
        self.makeUI()
    }
    
    private func makeUI() {
        self.makeImageView()
        self.makeLableModel()
        self.makelableModelValue()
        self.makeLableIsNew()
        self.makeLableIsNewValue()
        self.makeLableRating()
        self.makeStars()
        self.makeLableDescription()
        self.makeLableDescriptionValue()
    }
}

//MARK: -Make UI-
extension CellCar {
    
    private func makeImageView() {
        let size = CGSize.init(width: heightImageView, height: heightImageView)
        let rect = CGRect.init(origin: .zero, size: size)
        imgView = UIImageView.init(frame: rect)
        self.contentView.addSubview(imgView)
        imgView.center.x = UIScreen.main.bounds.width * 0.5
        imgView.center.y = heightImageView * 0.5
        imgView.backgroundColor = UIColor.init(red: 0.99, green: 0.99, blue: 0.99, alpha: 1)
    }
    
    private func makeLableModel() {
        lableModel = self.createBasicLable()
        lableModel.frame.origin.y = heightImageView
        lableModel.frame.origin.x = offsetX
        lableModel.text = "Model:"
    }
    
    private func makelableModelValue() {
        lableModelValue = self.createBasicLable()
        lableModelValue.frame.origin.y = lableModel.frame.origin.y
        lableModelValue.frame.origin.x = UIScreen.main.bounds.width * 0.5
        lableModelValue.textAlignment = .right
    }
    
    private func makeLableIsNew() {
        lableIsNew = self.createBasicLable()
        lableIsNew.frame.origin.x = offsetX
        lableIsNew.frame.origin.y = heightImageView + heightLine
        lableIsNew.text = "Is New:"
    }
    
    private func makeLableIsNewValue() {
        lableIsNewValue = self.createBasicLable()
        lableIsNewValue.frame.origin.x = UIScreen.main.bounds.width * 0.5
        lableIsNewValue.frame.origin.y = lableIsNew.frame.origin.y
        lableIsNewValue.textAlignment = .right
    }
    
    private func makeLableRating() {
        lableRating = self.createBasicLable()
        lableRating.frame.origin.x = offsetX
        lableRating.frame.origin.y = heightImageView + heightLine * 2
        lableRating.text = "Rating:"
    }
    
    
    private func makeStars() {
        let widht = heightLine * 0.8
        for _ in 1 ... 5 {
            let imageViewStar = UIImageView.init()
            imageViewStar.frame.size = CGSize.init(width: widht, height: widht)
            imageViewStar.center.y = heightImageView + heightLine * 2.5
            let starImage = "star.fill".getSymbol()
            imageViewStar.image = starImage
            starsImageViews.append(imageViewStar)
        }
    }
    
    private func makeLableDescription() {
        lableDescription = self.createBasicLable()
        lableDescription.frame.origin.x = offsetX
        lableDescription.frame.origin.y = heightImageView + heightLine * 3
        lableDescription.text = "Description:"
    }
    
    private func makeLableDescriptionValue() {
        let size = CGSize.init(width: widthLable * 2, height: heightLine * 2)
        let rect = CGRect.init(origin: .zero, size: size)
        lableDescriptionValue = UILabel.init(frame: rect)
        self.contentView.addSubview(lableDescriptionValue)
        lableDescriptionValue.numberOfLines = 3
        lableDescriptionValue.frame.origin.x = offsetX
        lableDescriptionValue.frame.origin.y = heightImageView + heightLine * 4
    }

}


//MARK: -Basic Lable-
extension CellCar {
    
    private func createBasicLable() -> UILabel {
        let size = CGSize.init(width: widthLable, height: heightLine)
        let rect = CGRect.init(origin: .zero, size: size)
        let lable = UILabel.init(frame: rect)
        self.contentView.addSubview(lable)
        return lable
    }
}

//MARK: -Set Stars-

extension CellCar {
    
    func setStars(rating: Int) {
        let firstRightStar = UIScreen.main.bounds.width - offsetX - starsImageViews.first!.frame.size.width * 0.5
        let distance = offsetX
        
        for i in 0 ..< rating {
            let star = starsImageViews[i]
            star.center.x = firstRightStar - (distance + star.frame.size.width * 0.5) * CGFloat(i)
            self.contentView.addSubview(star)
        }
        
    }
}


