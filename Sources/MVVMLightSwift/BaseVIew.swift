//
//  BaseView.swift
//  
//
//  Created by WebsoftProfession on 14/03/23.
//

import Foundation


public protocol BaseView: ViewModelLocatorSwiftUI {
    var viewModel: BaseViewModel { get }
}

extension BaseView {
    public static var bindingViewModel: T {
        Self.connectedViewModel!
    }
}
