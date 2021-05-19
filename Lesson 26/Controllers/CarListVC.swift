//
//  CarListVC.swift
//  Lesson 26
//
//  Created by Илья Петров on 04.04.2021.
//

import UIKit

class CarListVC: UITableViewController {
    
    var cars = [CarModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        self.makeBarButtonAdd()
        self.setTitle()
    }
    
    
}

//MARK: -Set Navigation Bar-

extension CarListVC {
    
    func makeBarButtonAdd() {
        let button = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(actionButtonAdd))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func actionButtonAdd() {
        let carVC = CarVC.init()
        let carModel = CarModel.init()
        carVC.car = carModel
        carVC.myDelegate = self
        navigationController?.pushViewController(carVC, animated: true)
    }
    
    func setTitle() {
        navigationItem.title = "Car list"
 
    }
  
}

//MARK: -Table View DataSource-
extension CarListVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CellCar
        if cell == nil {
            cell = CellCar.init(style: .default, reuseIdentifier: identifier)
//            cell?.imageView?.contentMode = .scaleAspectFill
        }
        
        let car = cars[indexPath.row]
        cell?.imgView.image = car.photo
        cell?.lableModelValue.text = car.model
        if car.isNew == true {
            cell?.lableIsNewValue.text = "Yes"
        }else {
            cell?.lableIsNewValue.text = "No"
        }
        if let rating = car.rating {
            cell?.setStars(rating: rating)
        }
        
        
        cell?.lableDescriptionValue.text = car.description
        
        
        
        
        return cell!
    }

}

//MARK: -Table View Delegate-
extension CarListVC {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CellCar.heightCell
    }
}

//MARK: -CarVCDelegate-

extension CarListVC: CarVCDelegate {
    func getCar(car: CarModel) {
        cars.append(car)
        tableView.reloadData()
    }
    
    
}
