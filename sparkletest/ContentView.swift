//
//  ContentView.swift
//  sparkletest
//
//  Created by guru on 1/20/23.
//

import SwiftUI
    let bundle = Bundle.main
    let version = bundle.object(forInfoDictionaryKey: "CFBundleVersion") as! String

struct ContentView: View {

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Version: \(version)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
