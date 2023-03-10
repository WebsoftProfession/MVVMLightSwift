//
//  BaseViewModel.swift
//  MVVMLightSwift
//
//  Created by WebsoftProfession on 19/08/22.
//

import Foundation
import Combine
import SwiftUI

@available(iOS 13.0, *)
open class BaseViewModel : ObservableObject {
    
    @Published var isLoading: Bool = false
    class var isFromCache: Bool {
        return false
    }
    
    required public init() {
        self.onLoad()
    }
    
    func onLoad(){
        
    }
    
    deinit {
        
    }
}
