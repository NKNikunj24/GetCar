//
//  CarDataResponse.swift
//  GetCar
//
//  Created by Nikunj Katlana on 06/07/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import Foundation
struct CarDataResponseModel : Decodable {
        let id : String?
        let modelIdentifier : String?
        let modelName : String?
        let group : String?
        let licensePlate : String?
        let innerCleanliness : String?
        let carImageUrl : String?
        let vehicleDetails : VehicleDetails?
        let location : Location?
        
        enum CodingKeys: String, CodingKey {
            
            case id = "id"
            case modelIdentifier = "modelIdentifier"
            case modelName = "modelName"
            case group = "group"
            case licensePlate = "licensePlate"
            case innerCleanliness = "innerCleanliness"
            case carImageUrl = "carImageUrl"
            case vehicleDetails = "vehicleDetails"
            case location = "location"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            modelIdentifier = try values.decodeIfPresent(String.self, forKey: .modelIdentifier)
            modelName = try values.decodeIfPresent(String.self, forKey: .modelName)
            group = try values.decodeIfPresent(String.self, forKey: .group)
            licensePlate = try values.decodeIfPresent(String.self, forKey: .licensePlate)
            innerCleanliness = try values.decodeIfPresent(String.self, forKey: .innerCleanliness)
            carImageUrl = try values.decodeIfPresent(String.self, forKey: .carImageUrl)
            vehicleDetails = try values.decodeIfPresent(VehicleDetails.self, forKey: .vehicleDetails)
            location = try values.decodeIfPresent(Location.self, forKey: .location)
        }
        
        struct Location : Codable {
            let latitude : Double?
            let longitude : Double?
            
            enum CodingKeys: String, CodingKey {
                
                case latitude = "latitude"
                case longitude = "longitude"
            }
            
            init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
                longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
            }
            
        }
        struct VehicleDetails : Codable {
            let name : String?
            let make : String?
            let color : String?
            let series : String?
            let fuel_type : String?
            let fuel_level : Double?
            let transmission : String?
            
            enum CodingKeys: String, CodingKey {
                
                case name = "name"
                case make = "make"
                case color = "color"
                case series = "series"
                case fuel_type = "fuel_type"
                case fuel_level = "fuel_level"
                case transmission = "transmission"
            }
            
            init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                make = try values.decodeIfPresent(String.self, forKey: .make)
                color = try values.decodeIfPresent(String.self, forKey: .color)
                series = try values.decodeIfPresent(String.self, forKey: .series)
                fuel_type = try values.decodeIfPresent(String.self, forKey: .fuel_type)
                fuel_level = try values.decodeIfPresent(Double.self, forKey: .fuel_level)
                transmission = try values.decodeIfPresent(String.self, forKey: .transmission)
            }
            
        }
    }

