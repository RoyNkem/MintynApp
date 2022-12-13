//
//  ViewController.swift
//  MintynApp
//
//  Created by Roy Aiyetin on 13/12/2022.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }


}


//MARK: - Integrate SwiftUI Preview
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewControllerPreview<HomeViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: HomeViewController
    
    init(_ builder: @escaping () -> HomeViewController) {
        viewController = builder()
    }
    
    //MARK: - ViewController Representable
    func makeUIViewController(context: Context) -> some UIViewController {
        viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        return
    }
}
#endif

#if canImport(SwiftUI) && DEBUG
import SwiftUI

let deviceNames: [String] = [
    "iPhone 12",
    "iPhone 14 Pro Max"
]

//MARK: Preview Provider
@available(iOS 13.0, *)
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        
        ForEach(deviceNames, id: \.self) {deviceName in
            UIViewControllerPreview {
                HomeViewController()
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
#endif

