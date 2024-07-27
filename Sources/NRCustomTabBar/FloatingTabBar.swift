//
//  FloatingTabBar.swift
//  Learn
//
//  Created by Nirav Ramani on 26/07/24.
//

import SwiftUI

struct FloatingTabBar: TabItemDetails, View {
 
    @Binding var selectedTab: UUID
    var tabItems: [TabItem]
    var selectedForegroundColor: Color = .blue
    var foregroundColor: Color = .gray
    var font: Font = .caption
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(tabItems) { item in
                    Button(action: {
                        withAnimation(.spring()) {
                            selectedTab = item.id
                        }
                    }) {
                        VStack {
                            Image(systemName: item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .background(
                                    Circle()
                                        .fill(selectedTab == item.id ? selectedForegroundColor : foregroundColor.opacity(0.2))
                                        .frame(width: 40, height: 40)
                                )
                                .padding()
                                .foregroundColor(selectedTab == item.id ? .white : foregroundColor)
                            Text(item.title)
                                .font(font)
                                .foregroundColor(selectedTab == item.id ? selectedForegroundColor : foregroundColor)
                        }
                        .padding([.top,.bottom], 8)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 30)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(radius: 5)
            .padding(.bottom, 20)
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 15)
    }
}