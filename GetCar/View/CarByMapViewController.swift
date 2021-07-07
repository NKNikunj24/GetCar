//
//  CarByMapViewController.swift
//  GetCar
//
//  Created by Nikunj Katlana on 06/07/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit
import MapKit

class CarByMapViewController: UIViewController,MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var carView: UIView!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carMake: UILabel!
    @IBOutlet weak var carSeries: UILabel!
    @IBOutlet weak var carPlate: UILabel!
    
    var carMapData : [CarDataResponseModel]? = nil
    private let reuseIdentifier = "MyIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        carView.isHidden =  true
        self.configureMap()
        self.placePins()
    }
    
    func configureMap() {
        let center = CLLocationCoordinate2D(latitude: 12.9486298, longitude: 77.6429308)
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func placePins() {
        var coords : [CLLocationCoordinate2D] = []
        var titles : [String] = []
        var subtittle : [String] = []
        for (_,item) in carMapData!.enumerated(){
            let destination = CLLocationCoordinate2DMake(item.location?.latitude ?? 0.0, item.location?.longitude ?? 0.0)
            coords.append(destination)
            titles.append(item.modelName ?? "")
            subtittle.append(item.licensePlate ?? "")
            
        }
        
        for i in coords.indices {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coords[i]
            annotation.title = titles[i]
            annotation.subtitle = subtittle[i]
            mapView.addAnnotation(annotation)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
        annotationView.markerTintColor = UIColor.black
        annotationView.glyphImage = UIImage(named: "mapCars")
        return annotationView
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
        print("didSelectAnnotationTapped")
        carView.isHidden =  false
        updateViewData(currPlate: (view.annotation?.subtitle ?? "") ?? "")
    }
    
    @IBAction func closeAction(_ sender: Any) {
        carView.isHidden =  true
    }
    func updateViewData (currPlate : String)
    {
        var carItem : [CarDataResponseModel]? = nil
        carItem?.removeAll()
        carItem =  carMapData!.filter{
            $0.licensePlate == currPlate
        }
        
        carName.text =  carItem?.first?.vehicleDetails?.name ?? ""
        carMake.text =  carItem?.first?.vehicleDetails?.make ?? ""
        carPlate.text =  carItem?.first?.licensePlate ?? ""
        carSeries.text = "Series " + (carItem?.first?.vehicleDetails?.series ?? "")
        carImage.setImage(with: carItem?.first?.carImageUrl, placeHolder: UIImage(named: "Placeholder"), completed: nil)
        
    }
}


