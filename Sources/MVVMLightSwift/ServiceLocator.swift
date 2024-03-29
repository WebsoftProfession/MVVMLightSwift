//
//  ServiceLocator.swift
//  MVVMLightSwift
//
//  Created by WebsoftProfession on 01/03/23.
//

import Foundation

public protocol IServiceLocator {
    associatedtype T where T:IServiceLocator
    init()
    var isLoading: Bool { get set }
}

extension IServiceLocator {
    public static var instance: T {
        return T.init()
    }
    
    public static var singletonInstance: T {
        let serviceName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String + "." + String(describing: T.self)
        return ServiceGenerator.services[serviceName] as! Self.T
    }
}
