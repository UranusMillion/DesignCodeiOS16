//
//  ContentView.swift
//  DesignCodeiOS16
//
//  Created by leonlee on 2023/2/13.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu: Bool = false
//    @State private var selectedMenu: Menu = .compass
    @AppStorage("selectedMenu") var selectedMenu: Menu = .compass //持久保存
    @GestureState var press = false //手勢狀態
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 1)
            .updating($press) { currentState, gestureState, transaction in
                gestureState = currentState
            }
            .onEnded { value in
                showMenu = true
            }
    }
    
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            
            switch selectedMenu {
            case .compass:
                MessageView()
            case .card:
                Text("Card")
            case .charts:
                DetailView()
            case .radial:
                Text("Radial")
            case .halfsheet:
                MenuView()
            case .gooey:
                Text("Gooey")
            case .actionbutton:
                Text("Action Button")
            }
        }
        .onTapGesture { } //滾動視圖效果不佳 暫時解決方案＝＝？
        .gesture(longPress)
        .sheet(isPresented: $showMenu) {
//            MenuView(selectedMenu: $selectedMenu)
            MenuView()
                .presentationDetents([.medium,.large])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           
    }
}
