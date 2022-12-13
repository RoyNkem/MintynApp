//
//  WelcomeViewController.swift
//  MintynApp
//
//  Created by Roy Aiyetin on 13/12/2022.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBAction func loginButton(_ sender: UIButton) {
        
    }
    
    @IBAction func registerNewDevice(_ sender: UIButton) {
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.roundCorners([.topLeft, .topRight], radius: 30)
    }

}



////MARK: - Integrate SwiftUI Preview
//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//struct UIViewControllerPreview<LoginViewController: UIViewController>: UIViewControllerRepresentable {
//    
//    let viewController: LoginViewController
//
//    init(_ builder: @escaping () -> LoginViewController) {
//        viewController = builder()
//    }
//    
//    //MARK: - ViewController Representable
//    func makeUIViewController(context: Context) -> some UIViewController {
//        viewController
//    }
//    
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//        return
//    }
//}
//#endif
//
//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//
//let deviceNames: [String] = [
//    "iPhone 12",
//    "iPhone 14 Pro Max"
//]
//
////MARK: Preview Provider
//@available(iOS 13.0, *)
//struct ViewController_Preview: PreviewProvider {
//    static var previews: some View {
//
//        ForEach(deviceNames, id: \.self) {deviceName in
//            UIViewControllerPreview {
//                LoginViewController()
//            }
//            .previewDevice(PreviewDevice(rawValue: deviceName))
//            .previewDisplayName(deviceName)
//        }
//    }
//}
//#endif
