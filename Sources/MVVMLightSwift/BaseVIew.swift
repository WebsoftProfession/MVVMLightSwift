//
//  BaseView.swift
//  
//
//  Created by WebsoftProfession on 14/03/23.
//

import Foundation


public protocol BaseView: ViewModelLocatorSwiftUI {
    var viewModel: T { get }
}

extension BaseView {
    @MainActor public static var bindingViewModel: T {
        Self.connectedViewModel!
    }
}
