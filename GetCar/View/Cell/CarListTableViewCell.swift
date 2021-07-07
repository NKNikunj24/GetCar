//
//  CarListTableViewCell.swift
//  GetCar
//
//  Created by Nikunj Katlana  on 06/07/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit

class CarListTableViewCell: UITableViewCell {

    @IBOutlet weak var carImg: UIImageView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carMake: UILabel!
    @IBOutlet weak var carPlate: UILabel!
    @IBOutlet weak var carSeries: UILabel!
    
    static let cellIdentifier = "CarListTableViewCell"
    static let cellNib = UINib(nibName: "CarListTableViewCell", bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData (curResponse : CarDataResponseModel)
    {
        carName.text =  curResponse.vehicleDetails?.name ?? ""
        carMake.text =  curResponse.vehicleDetails?.make ?? ""
        carPlate.text =  curResponse.licensePlate ?? ""
        carSeries.text = "Series " + (curResponse.vehicleDetails?.series ?? "") 
        carImg.setImage(with: curResponse.carImageUrl, placeHolder: UIImage(named: "Placeholder"), completed: nil)
    }
}
