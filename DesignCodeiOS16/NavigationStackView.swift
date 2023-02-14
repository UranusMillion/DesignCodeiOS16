//
//  NavigationStackView.swift
//  DesignCodeiOS16
//
//  Created by leonlee on 2023/2/14.
//

import SwiftUI

struct NavigationStackView: View {
    var body: some View {
        NavigationStack {
            List(navigationItem) { item in
                NavigationLink(value: item) {
                    Label(item.title, systemImage: item.icon)
                        .foregroundColor(.primary)
                }
            }
            .navigationDestination(for: NavigationItem.self) { item in
                switch item.menu {
                case .compass:
                    ContentView()
                case .card:
                    Text(item.title)
                case .charts:
                    Text(item.title)
                case .radial:
                    Text(item.title)
                case .halfsheet:
                    Text(item.title)
                case .gooey:
                    Text(item.title)
                case .actionbutton:
                    Text(item.title)
                }
            }
            .navigationTitle("SwiftUI Apps")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
        }
    }
}

struct NavigationStackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackView()
    }
}