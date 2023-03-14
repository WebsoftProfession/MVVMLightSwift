//
//  ViewModelLocator.swift
//  MVVMLightSwift
//
//  Created by WebsoftProfession on 06/06/22.
//

import Foundation
import SwiftUI
import Combine


fileprivate final class ModelGenerator {
    @available(iOS 13.0, *)
    static var models = [String:BaseViewModel]()
    @available(iOS 13.0, *)
    static func generateModel(viewModelName: String) -> BaseViewModel? {
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let object: AnyClass? = NSClassFromString("\(namespace).\(viewModelName)") ?? nil
        
        if let viewModel = object as? BaseViewModel.Type {
            if viewModel.isFromCache && models.keys.contains(viewModelName) {
                return models[viewModelName]
            }
            else{
                let viewModel = (object as! BaseViewModel.Type).init()
                models.updateValue(viewModel, forKey: viewModelName)
                return viewModel
            }
        }
        return nil
    }
}

final class ServiceGenerator {
    static var services = [String:BaseService]()
    static func registerService(serviceName: String, service: BaseService) {
        if !services.keys.contains(serviceName) {
            services.updateValue(service, forKey: serviceName)
        }
    }
}


public protocol ViewModelLocatorUIKit {
    associatedtype T
}

extension ViewModelLocatorUIKit {
    static var connectedViewModel: T? {
        let nameofClass = String(describing: self);
        let regex = try! NSRegularExpression(pattern: #"(?<=\<)(.*?)(?=\>)"#, options: .caseInsensitive)
        if let match = regex.firstMatch(in: nameofClass, range: NSRange(nameofClass.startIndex..., in: nameofClass)) {
            let viewModelString = nameofClass[Range(match.range(at: 1), in: nameofClass)!]
            if #available(iOS 13.0, *) {
                return ModelGenerator.generateModel(viewModelName: String(viewModelString)) as? Self.T
            } else {
                // Fallback on earlier versions
            }
        }
        return nil
    }
}


@available(iOS 13.0, *)
public protocol ViewModelLocatorSwiftUI: View {
    associatedtype T
}

@available(iOS 13.0, *)
extension ViewModelLocatorSwiftUI {
    
    public static var connectedViewModel: T? {
        let nameofClass = String(describing: type(of: self));
        let regex = try! NSRegularExpression(pattern: #"(?<=\<)(.*?)(?=\>)"#, options: .caseInsensitive)
        if let match = regex.firstMatch(in: nameofClass, range: NSRange(nameofClass.startIndex..., in: nameofClass)) {
            let viewModelString = nameofClass[Range(match.range(at: 1), in: nameofClass)!]
            return ModelGenerator.generateModel(viewModelName: String(viewModelString)) as? Self.T
        }
        return nil
    }
}
