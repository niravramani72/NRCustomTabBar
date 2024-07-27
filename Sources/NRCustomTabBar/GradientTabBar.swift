//
//  GradientTabBar.swift
//  Learn
//
//  Created by Nirav Ramani on 26/07/24.
//

import Foundation
import SwiftUI

public struct GradientTabBar: TabItemDetails, View {
    
    @Binding var selectedTab: UUID
    var tabItems: [TabItem]
    var selectedForegroundColor: Color = .white
    var foregroundColor: Color = .gray
    var font: Font = .caption
    var gradientColors: [Color] = [.blue, .purple]
    
    public var body: some View {
        GeometryReader { geometry in
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
                                .padding()
                                .background(
                                    ZStack {
                                        if selectedTab == item.id {
                                            Circle()
                                                .fill(LinearGradient(
                                                    gradient: Gradient(colors: gradientColors),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                ))
                                                .frame(width: 40, height: 40)
                                        }
                                    }
                                )
                                .foregroundColor(selectedTab == item.id ? selectedForegroundColor : foregroundColor)
                            Text(item.title)
                                .font(font)
                                .foregroundColor(selectedTab == item.id ? gradientColors.first ?? .blue : foregroundColor)
                                .scaleEffect(selectedTab == item.id ? 1.1 : 1.0)
                                .animation(.spring(), value: selectedTab)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.bottom, geometry.safeAreaInsets.bottom)
            .background(Color.white)
            .shadow(radius: 0.5)
        }
        .frame(height: 60)
    }
}
