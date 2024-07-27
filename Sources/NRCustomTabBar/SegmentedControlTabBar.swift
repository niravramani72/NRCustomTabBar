//
//  SegmentedControlTabBar.swift
//  Learn
//
//  Created by Nirav Ramani on 26/07/24.
//

import Foundation
import SwiftUI

public struct SegmentedControlTabBar: TabItemDetails, View {
    
    @Binding var selectedTab: UUID
    var tabItems: [TabItem]
    var selectedForegroundColor: Color = .white
    var foregroundColor: Color = .blue
    var font: Font = .caption
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ForEach(tabItems) { item in
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedTab = item.id
                        }
                    }) {
                        VStack {
                            Image(systemName: item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(selectedTab == item.id ? selectedForegroundColor : foregroundColor)
                            Text(item.title)
                                .font(.caption)
                                .foregroundColor(selectedTab == item.id ? selectedForegroundColor : foregroundColor)
                        }
                        .padding()
                      
                    }
                    .frame(maxWidth: .infinity)
                    .background(
                        Rectangle()
                            .fill(selectedTab == item.id ? foregroundColor : selectedForegroundColor)
                            .shadow(radius: selectedTab == item.id ? 1 : 0)
                    )
                }
            }
            .padding(.bottom, geometry.safeAreaInsets.bottom)
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
        .frame(height: 50)
    }
}
