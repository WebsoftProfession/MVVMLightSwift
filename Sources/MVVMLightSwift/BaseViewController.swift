//
//  BaseViewController.swift
//  MVVMLightSwift
//
//  Created by WebsoftProfession on 02/03/23.
//

import UIKit

open class BaseViewController<T>: UIViewController, ViewModelLocatorUIKit  {
    
    public var viewModel = BaseViewController<T>.connectedViewModel!
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
