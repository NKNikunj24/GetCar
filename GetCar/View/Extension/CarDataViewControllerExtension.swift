//
//  CarDataViewControllerExtension.swift
//  GetCar
//
//  Created by Nikunj Katlana  on 06/07/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension CarByListViewController :  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carListSelectedData?.count ?? 0
  }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  =  tableView.dequeueReusableCell(withIdentifier: "CarListTableViewCell", for: indexPath) as! CarListTableViewCell
        cell.setData(curResponse: (carListSelectedData?[indexPath.row])!)
        return cell
    }
}

//carByGroup
extension CarByListViewController :  UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carByGroup.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarGroupCell", for: indexPath) as! CarGroupCell
        cell.groupName.text = carByGroup[indexPath.row]
       let caritem = carListData!.filter {
                   $0.group ==   carByGroup[indexPath.row]
               }
        cell.carImg.setImage(with: caritem[0].carImageUrl, placeHolder: UIImage(named: "Placeholder"), completed: nil)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currItem =  carByGroup[indexPath.row]
        sortDataSelected(currType: currItem)
    }
}

extension UIImageView {
func setImage(with url: String?, placeHolder: UIImage? = nil, completed: (() -> Void)? = nil) {
    if let urlString = url {
        let url = URL(string: urlString)
        self.kf.indicatorType = .none
        self.kf.setImage(with: url, placeholder: placeHolder, options: [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage
        ], progressBlock: nil) { (result) in
            completed?()
        }
    } else {
        self.image = placeHolder
    }
}
}
