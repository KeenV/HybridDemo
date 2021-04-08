//
//  ContentView.swift
//  H5Interact
//
//  Created by Leaf on 2020/8/6.
//  Copyright © 2020 leaf. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        H5WebViewController()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
