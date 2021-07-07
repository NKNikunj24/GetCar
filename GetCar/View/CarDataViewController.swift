//
//  AvaliableCarViewController.swift
//  GetCar
//
//  Created by Nikunj Katlana on 06/07/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit

class CarDataViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    let carViewModel : CarDataViewModel = CarDataViewModel()
    var carData : [CarDataResponseModel]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCarDetailApiCall()
    }
    
    func getCarDetailApiCall(){
        carViewModel.getCarResult() { (carDetailApiResponse) in
            if(carDetailApiResponse != nil)
            {
                self.carData = carDetailApiResponse
                DispatchQueue.main.async {
                    self.setupSegmentedControl(selectedIndex: 0)
                }
            }
        }
    }
    
    @IBAction func segmentAction(_ sender: Any) {
        setupSegmentedControl(selectedIndex: segmentControl.selectedSegmentIndex)
    }
    
    private func setupSegmentedControl(selectedIndex : NSInteger) {
        switch selectedIndex
        {
        case 0:
            remove(asChildViewController: carByMapViewController)
            add(asChildViewController: carByListViewController)
        case 1:
            remove(asChildViewController: carByListViewController)
            add(asChildViewController: carByMapViewController)
        default:
            break;
        }
    }
    
    // Child1
    private lazy var carByListViewController: CarByListViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "CarByListViewController") as! CarByListViewController
            viewController.carListData = carData
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    // Child 2
    private lazy var carByMapViewController: CarByMapViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "CarByMapViewController") as! CarByMapViewController
            viewController.carMapData = carData
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    
    //MARK: ADD Child
    private func add(asChildViewController viewController: UIViewController) {
        addChild(viewController)
        containerView.addSubview(viewController.view)
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    //MARK: REMOVE Child
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        // Notify Child View Controller
        viewController.removeFromParent()
    }
}
