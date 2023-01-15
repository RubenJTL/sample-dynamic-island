//
//  ContentView.swift
//  sample-dynamic-island
//
//  Created by Ruben Torres on 15/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TimeTrackingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
