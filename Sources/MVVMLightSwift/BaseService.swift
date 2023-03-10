//
//  IBaseService.swift
//  MVVMLightSwift
//
//  Created by WebsoftProfession on 10/03/23.
//

import Foundation


protocol IBaseService: IServiceLocator where T == BaseService { }

public class BaseService: IBaseService {
    var isLoading: Bool
    required init() {
        self.isLoading = false
    }
    
    func registerSingleton() {
        ServiceGenerator.registerService(serviceName: String(describing: self), service: self)
    }
}




