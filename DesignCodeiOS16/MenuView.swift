//
//  MenuView.swift
//  DesignCodeiOS16
//
//  Created by 李孟儒 on 2023/2/14.
//

import SwiftUI

struct MenuView: View {
//    @Binding var selectedMenu: Menu
    @AppStorage("selectedMenu") var selectedMenu: Menu = .compass

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List(navigationItems) { item in
            Button {
                selectedMenu = item.menu
                dismiss()
            } label: {
                Label(item.title, systemImage: item.icon)
                    .foregroundColor(.primary)
                    .padding(8)
            }

        }
        .listStyle(.plain)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
//        MenuView(selectedMenu: .constant(.compass))
        MenuView()
    }
}
