//
//  CarVC.swift
//  Lesson 26
//
//  Created by Илья Петров on 04.04.2021.
//

import UIKit

protocol CarVCDelegate {
    func getCar(car: CarModel)
}

class CarVC: UITableViewController {
    
    
    
    enum Cells: Int, CaseIterable {
        case photo
        case model
        case isNew
        case rating
        case description
    }
    
    //MARK: -Properties-
    
    var myDelegate: CarVCDelegate!
    
    var car: CarModel!
}


//MARK: -Life cycle controler-

extension CarVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        self.makeButtonBarSave()
        self.setTitle()
        self.tableView.keyboardDismissMode = .onDrag
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.textViewCloseKeyboard()
        self.textFieldCloseKeyboard()
    }
}

//MARK: -Set Navigation Bar-

extension CarVC {
    
    func setTitle() {
        navigationItem.title = "New Car"
    }
    
    func makeButtonBarSave() {
        let buttonSave = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: #selector(actionButtonSave))
        navigationItem.rightBarButtonItem = buttonSave
        let buttonCancel = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action: #selector(actionButtonCancel))
        navigationItem.leftBarButtonItem = buttonCancel
    }
    
    @objc func actionButtonSave() {
        myDelegate.getCar(car: car)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func actionButtonCancel() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: -Make Table-

extension CarVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cells.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellType = Cells.init(rawValue: indexPath.row) else {
            fatalError()
        }
        
        switch cellType {
        case .photo:
            let cell = self.makeCellPhoto()
            return cell
        case .model:
            let cell = self.makeCellTextField()
            return cell
        case .isNew:
            let cell = self.makeCellSwitch()
            return cell
        case .rating:
            let cell = self.makeCellRating()
            return cell
        case .description:
            let cell = self.makeTextView()
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cell = Cells.init(rawValue: indexPath.row) else {
            fatalError()
        }
        switch cell {
        case .photo:
            return CellPhoto.height
        case .model:
            return CellTextField.height
        case .isNew:
            return CellSwitch.height
        case .rating:
            return CellRating.heght
        case .description:
            return CellTextView.hight
        }
    }
}

//MARK: -Make Sell-

extension CarVC {
    
    private func makeCellPhoto() -> CellPhoto {
        let identifier = String.init(describing: CellPhoto.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CellPhoto
        if cell == nil {
            cell = CellPhoto.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.buttonCamera.addTarget(self, action: #selector(callCamera), for: .touchUpInside)
        cell?.buttonLibrary.addTarget(self, action: #selector(openLibrary), for: .touchUpInside)
        cell?.photoView.image = car.photo
        return cell!
    }
    
    private func makeCellTextField() -> CellTextField {
        let identifier = String.init(describing: CellTextField.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CellTextField
        if cell == nil {
            cell = CellTextField.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.textField.delegate = self
        cell?.textField.text = car.model
    
        
        return cell!
    
    }
    
    private func makeCellSwitch() -> CellSwitch {
        let identifier = String.init(describing: CellSwitch.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CellSwitch
        if cell == nil {
            cell = CellSwitch.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.swich.isOn = car.isNew
        cell?.swich.addTarget(self, action: #selector(actionSwitch(swich:)), for: .valueChanged)
        return cell!
    }
    
    private func makeCellRating() -> CellRating {
        let identifier = String.init(describing: CellRating.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CellRating
        if cell == nil {
            cell = CellRating.init(style: .default, reuseIdentifier: identifier)
        }
        for button in cell!.arrayStar {
            button.addTarget(self, action: #selector(actionRating(button:)), for: .touchUpInside)
        }
        
        return cell!
    }

    private func makeTextView() -> CellTextView {
        let identifier = String.init(describing: CellTextView.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CellTextView
        if cell == nil {
            cell = CellTextView.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.textView.delegate = self
        cell?.textView.text = car.description
        
        return cell!
    }
}

extension CarVC {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.textViewCloseKeyboard()
        self.textFieldCloseKeyboard()
    }
}

//MARK: -Action button for photo-

extension CarVC {
    
    @objc func callCamera() {
        self.textViewCloseKeyboard()
        self.textFieldCloseKeyboard()
        let vC = UIImagePickerController.init()
        vC.sourceType = .camera
        vC.allowsEditing = false
        vC.delegate = self
        self.present(vC, animated: true, completion: nil)
        
    }
    
    @objc func openLibrary() {
        self.textViewCloseKeyboard()
        self.textFieldCloseKeyboard()
        let vC = UIImagePickerController.init()
        vC.sourceType = .photoLibrary
        vC.allowsEditing = false
        vC.delegate = self
        self.present(vC, animated: true, completion: nil)
    }
}

extension CarVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        car.photo = image
        tableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: -Text Delegate-

extension CarVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text
        car.model = text
        tableView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: -Switch Action-

extension CarVC {
    @objc func actionSwitch(swich: UISwitch) {
        self.textViewCloseKeyboard()
        self.textFieldCloseKeyboard()
        car.isNew = swich.isOn
        tableView.reloadData()
    }
}

//MARK: -Rating Action-

extension CarVC {
    
    @objc func actionRating(button: UIButton) {
        self.textViewCloseKeyboard()
        self.textFieldCloseKeyboard()
        let tag = button.tag
        let cell = button.superview!.superview as! CellRating
        
        for starButton in cell.arrayStar {
            if starButton.tag <= tag {
                starButton.setImage("star.fill".getSymbol(), for: .normal)
            }else {
                starButton.setImage("star".getSymbol(), for: .normal)
            }
        }
        car.rating = tag
    }
}

//MARK: -Description -

extension CarVC: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        let text = textView.text
        car.description = text
        
    }
}

//MARK: -Close Keyboard-

extension CarVC {
    func textViewCloseKeyboard() {
        let indexPath = IndexPath.init(row: Cells.description.rawValue, section: 0)
        if let cell = tableView.cellForRow(at: indexPath) as? CellTextView {
            cell.textView.resignFirstResponder()
        }
    }
    
    func textFieldCloseKeyboard() {
        let indexPath = IndexPath.init(row: Cells.model.rawValue, section: 0)
        if let cell = tableView.cellForRow(at: indexPath) as? CellTextField {
            cell.textField.resignFirstResponder()
            
        }
    }
}




