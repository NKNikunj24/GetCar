//
//  CarByListViewController.swift
//  GetCar
//
//  Created by Nikunj Katlana on 06/07/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit

class CarByListViewController: UIViewController {
    
    
    @IBOutlet weak var groupCollectionView: UICollectionView!
    @IBOutlet weak var carTableView: UITableView!
    
    var carListData : [CarDataResponseModel]? = nil
    var carByGroup : [String] = []
    var carListSelectedData : [CarDataResponseModel]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carTableView.tableFooterView = UIView()
        carTableView.register(CarListTableViewCell.cellNib, forCellReuseIdentifier: CarListTableViewCell.cellIdentifier)
        carByGroup.removeAll()
        carByGroup =  Array(Set(carListData!.compactMap {$0.modelName}))
        carListSelectedData = carListData!.filter {
            $0.group ==  carByGroup[0]
        }
        carTableView.reloadData()
    }
    
    func sortDataSelected (currType : String)
    {
        carListSelectedData = carListData!.filter {
            $0.group ==  currType
        }
        carTableView.reloadData()
    }
}
