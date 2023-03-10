//
//  InstanceLocator.swift
//  MVVMLightSwift
//
//  Created by WebsoftProfession on 01/03/23.
//

import Foundation

public class InstanceLocator<T:BaseService>: NSObject, IServiceLocator {
    
    required override init() {
        self.isLoading = false
    }
    var isLoading: Bool
}

