//
//  H5ViewController.swift
//  H5Interact
//
//  Created by Leaf on 2021/4/8.
//  Copyright © 2021 leaf. All rights reserved.
//

import SwiftUI

struct H5WebViewController: UIViewControllerRepresentable {
        
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UIHostingController(rootView: H5WebView())
        controller.rootView.add {
            context.coordinator.camera(controller)
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject {
        func camera(_ controller: UIViewController) -> Void {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            controller.present(imagePicker, animated: true) {
                
            }
        }
    }
}

struct H5ViewController_Previews: PreviewProvider {
    static var previews: some View {
        H5WebViewController()
    }
}
