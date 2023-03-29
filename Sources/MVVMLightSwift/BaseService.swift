//
//  IBaseService.swift
//  MVVMLightSwift
//
//  Created by WebsoftProfession on 10/03/23.
//

import Foundation


protocol IBaseService: IServiceLocator where T == BaseService { }

open class BaseService: NSObject, IBaseService {
    
    public typealias T = BaseService
    
    public var isLoading: Bool
    
    required public override init() {
        self.isLoading = false
    }
    
    public func registerSingleton() {
        let serviceName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String + "." + String(describing: type(of: self))
        ServiceGenerator.registerService(serviceName: serviceName, service: self)
    }
}




