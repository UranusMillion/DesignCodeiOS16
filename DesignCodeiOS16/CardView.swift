//
//  CardView.swift
//  DesignCodeiOS16
//
//  Created by leonlee on 2023/2/15.
//

import SwiftUI

struct CardView: View {
    
    var body: some View {
        Grid {
            GridRow {
                card
                card
            }
            GridRow {
                card.gridCellColumns(2)
            }
            GridRow {
                card
                card
            }
        }
        .padding(20)
    }
    
    var card: some View {
        VStack(spacing:12) {
            Image(systemName: "aspectratio")
                .frame(width: 44, height: 44)
                .foregroundStyle(.linearGradient(colors: [.white,.clear], startPoint: .topLeading, endPoint: .bottomTrailing))
            .background(
                HexagonShape()
                    .stroke()
                    .foregroundStyle(.linearGradient(colors: [.white.opacity(0.7),.clear], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
            .background(
                HexagonShape()
                    .foregroundStyle(.linearGradient(colors: [.clear,.white.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
            Text("Up to 8k resolution".uppercased())
                .font(.title3.width(.condensed).bold())
                .multilineTextAlignment(.center)
            Text("From huge monitors to the phone,your wallpaper will look greatt anywhere.")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .opacity(0.7)
                .frame(maxWidth: .infinity)
        }
        .frame(maxHeight: .infinity)
        .padding().padding(.vertical)
        .background(.black)
        .foregroundColor(.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke()
                .fill(.white.opacity(0.2))
        )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

struct HexagonShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.26809*width, y: 0.10578*height))
        path.addCurve(to: CGPoint(x: 0.36482*width, y: 0.05411*height), control1: CGPoint(x: 0.31753*width, y: 0.07724*height), control2: CGPoint(x: 0.34119*width, y: 0.06361*height))
        path.addCurve(to: CGPoint(x: 0.63518*width, y: 0.05411*height), control1: CGPoint(x: 0.45157*width, y: 0.01925*height), control2: CGPoint(x: 0.54843*width, y: 0.01925*height))
        path.addCurve(to: CGPoint(x: 0.73191*width, y: 0.10578*height), control1: CGPoint(x: 0.65881*width, y: 0.06361*height), control2: CGPoint(x: 0.68247*width, y: 0.07724*height))
        path.addCurve(to: CGPoint(x: 0.82501*width, y: 0.16371*height), control1: CGPoint(x: 0.78134*width, y: 0.13432*height), control2: CGPoint(x: 0.80497*width, y: 0.148*height))
        path.addCurve(to: CGPoint(x: 0.96019*width, y: 0.39785*height), control1: CGPoint(x: 0.89858*width, y: 0.22141*height), control2: CGPoint(x: 0.94701*width, y: 0.30529*height))
        path.addCurve(to: CGPoint(x: 0.96381*width, y: 0.50745*height), control1: CGPoint(x: 0.96379*width, y: 0.42307*height), control2: CGPoint(x: 0.96381*width, y: 0.45037*height))
        path.addCurve(to: CGPoint(x: 0.96019*width, y: 0.61706*height), control1: CGPoint(x: 0.96381*width, y: 0.56453*height), control2: CGPoint(x: 0.96379*width, y: 0.59184*height))
        path.addCurve(to: CGPoint(x: 0.82501*width, y: 0.85119*height), control1: CGPoint(x: 0.94701*width, y: 0.70961*height), control2: CGPoint(x: 0.89858*width, y: 0.7935*height))
        path.addCurve(to: CGPoint(x: 0.73191*width, y: 0.90913*height), control1: CGPoint(x: 0.80497*width, y: 0.86691*height), control2: CGPoint(x: 0.78134*width, y: 0.88059*height))
        path.addCurve(to: CGPoint(x: 0.63518*width, y: 0.96079*height), control1: CGPoint(x: 0.68247*width, y: 0.93767*height), control2: CGPoint(x: 0.65881*width, y: 0.95129*height))
        path.addCurve(to: CGPoint(x: 0.36482*width, y: 0.96079*height), control1: CGPoint(x: 0.54843*width, y: 0.99565*height), control2: CGPoint(x: 0.45157*width, y: 0.99565*height))
        path.addCurve(to: CGPoint(x: 0.26809*width, y: 0.90913*height), control1: CGPoint(x: 0.34119*width, y: 0.95129*height), control2: CGPoint(x: 0.31753*width, y: 0.93767*height))
        path.addCurve(to: CGPoint(x: 0.17499*width, y: 0.85119*height), control1: CGPoint(x: 0.21866*width, y: 0.88059*height), control2: CGPoint(x: 0.19503*width, y: 0.86691*height))
        path.addCurve(to: CGPoint(x: 0.03981*width, y: 0.61706*height), control1: CGPoint(x: 0.10142*width, y: 0.7935*height), control2: CGPoint(x: 0.05299*width, y: 0.70961*height))
        path.addCurve(to: CGPoint(x: 0.03619*width, y: 0.50745*height), control1: CGPoint(x: 0.03622*width, y: 0.59184*height), control2: CGPoint(x: 0.03619*width, y: 0.56453*height))
        path.addCurve(to: CGPoint(x: 0.03981*width, y: 0.39785*height), control1: CGPoint(x: 0.03619*width, y: 0.45037*height), control2: CGPoint(x: 0.03622*width, y: 0.42307*height))
        path.addCurve(to: CGPoint(x: 0.17499*width, y: 0.16371*height), control1: CGPoint(x: 0.05299*width, y: 0.30529*height), control2: CGPoint(x: 0.10142*width, y: 0.22141*height))
        path.addCurve(to: CGPoint(x: 0.26809*width, y: 0.10578*height), control1: CGPoint(x: 0.19503*width, y: 0.148*height), control2: CGPoint(x: 0.21866*width, y: 0.13432*height))
        path.closeSubpath()
        return path
    }
}

