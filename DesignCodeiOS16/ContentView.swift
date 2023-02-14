//
//  ContentView.swift
//  DesignCodeiOS16
//
//  Created by leonlee on 2023/2/13.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu: Bool = false
    @State private var selectedMenu: Menu = .compass
    
    var body: some View {
        ZStack {
            switch selectedMenu {
            case .compass:
                MessageView()
            case .card:
                Text("Card")
            case .charts:
                Text("Charts")
            case .radial:
                Text("Radial")
            case .halfsheet:
                Text("Half Sheet")
            case .gooey:
                Text("Gooey")
            case .actionbutton:
                Text("Action Button")
            }
            
            Button("Show Menu") {
                showMenu = true
            }
            .sheet(isPresented: $showMenu) {
                MenuView(selectedMenu: $selectedMenu)
                    .presentationDetents([.medium,.large])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           
    }
}
