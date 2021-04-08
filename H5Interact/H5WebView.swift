//
//  ContentView.swift
//  H5Interact
//
//  Created by Leaf on 2020/8/6.
//  Copyright © 2020 leaf. All rights reserved.
//

import SwiftUI
import WebKit

struct H5WebView: UIViewRepresentable {
    
    typealias MessageHandler = () -> Void
    
    var handlers = [MessageHandler]()
    
    mutating func add(_ messageHandler: @escaping MessageHandler) {
        handlers.append(messageHandler)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        let controller = WKUserContentController()
        let script = WKUserScript(source: """
window.webkit.messageHandlers.callTest.postMessage({

})
""", injectionTime: .atDocumentStart, forMainFrameOnly: true)
        controller.addUserScript(script)
        controller.add(context.coordinator, name: "callTest")
        configuration.userContentController = controller
        let view = WKWebView(frame: .zero, configuration: configuration)
        view.load(URLRequest(url: URL(string:"https://www.apple.com")!))
        view.uiDelegate = context.coordinator
        view.navigationDelegate = context.coordinator
        return view
    }
    
    func updateUIView(_ view: WKWebView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
        
        var view: H5WebView
        
        init(_ view: H5WebView) {
            self.view = view
        }
        
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            view.handlers.forEach { v in
                v()
            }
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//            if navigationAction.navigationType == .linkActivated {
//                decisionHandler(.cancel)
//                return
//            }
            decisionHandler(.allow)
        }
        
//        func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
//            print("response", navigationResponse)
//            decisionHandler(.allow)
//        }
    }
}

struct H5WebView_Previews: PreviewProvider {
    static var previews: some View {
        H5WebView()
    }
}
