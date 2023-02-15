//
//  RadialLayoutView.swift
//  DesignCodeiOS16
//
//  Created by 李孟儒 on 2023/2/15.
//

import SwiftUI

struct RadialLayoutView: View {
    var icons = ["calendar","message","figure.walk","music.note"]
    var numbers = [12,1,2,3,4,5,6,7,8,9,10,11]
    @State private var isRadial: Bool = true
    
    
    var body: some View {
        let layout = isRadial ? AnyLayout(RadialLayout()): AnyLayout(CustomLayout())
        
        
        ZStack {
            layout {
                ForEach(icons,id: \.self) { item in
                    Circle()
                        .frame(width: 44)
                        .foregroundColor(.black)
                        .overlay(
                            Image(systemName: item)
                                .foregroundColor(.white)
                        )
                }
            }
            .frame(width: 120)
            
            layout {
                ForEach(numbers,id: \.self) { item in
                    Text("\(item)")
                        .font(.system(.title, design: .rounded)).bold()
                        .foregroundColor(.black)
                        .offset(x: isRadial ? 0:50)
                }
            }
            .frame(width: 240)
            
            layout {
                ForEach(numbers,id: \.self) { item in
                    Text("\(item * 5)")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.black)
                        .offset(x: isRadial ? 0:100)
                }
            }
            .frame(width: 360)
            
            Circle()
                .strokeBorder(style: StrokeStyle(lineWidth: 10,dash: [1,10]))
                .frame(width: 220)
        }
        .onTapGesture {
            withAnimation(.spring()) {
                isRadial.toggle()
            }
        }
    }
}

struct RadialLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        RadialLayoutView()
    }
}


struct CustomLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for (index,subview) in subviews.enumerated() {
            // Position
            var point = CGPoint(x: 20 * index, y: 20 * index).applying(CGAffineTransform(rotationAngle: CGFloat(6 * index + 6)))
            
            // Center
            point.x += bounds.midX
            point.y += bounds.midY
            
            subview.place(at: point, anchor: .center ,proposal: .unspecified)
        }
    }
}

struct RadialLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        let radius = bounds.width / 3.0 //寬度除以３取得半徑
        let angle = Angle(degrees: 360.0 / Double(subviews.count)).radians
        
        for (index,subview) in subviews.enumerated() {
            // Position
            var point = CGPoint(x: 0, y: -radius).applying(CGAffineTransform(rotationAngle: angle * Double(index)))
            
            // Center
            point.x += bounds.midX
            point.y += bounds.midY
            
            subview.place(at: point, anchor: .center ,proposal: .unspecified)
        }
    }
}
