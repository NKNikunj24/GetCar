//
//  CarDataViewModel.swift
//  GetCar
//
//  Created by Nikunj Katlana on 06/07/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import Foundation

struct CarDataViewModel
{
    func getCarResult(completion: @escaping(_ result: [CarDataResponseModel]?)-> Void)
    {
        let httpUtility = HttpUtility()
        let requestUrl = URL(string:AppConstants.baseUrl)!
            
              httpUtility.getApiData(requestUrl: requestUrl, resultType: [CarDataResponseModel].self) { (carDataApiResponse) in

                  _ = completion(carDataApiResponse)
              }
    }
}
