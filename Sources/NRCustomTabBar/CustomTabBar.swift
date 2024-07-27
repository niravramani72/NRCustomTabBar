//
//  CustomTabBar.swift
//  Learn
//
//  Created by Nirav Ramani on 26/07/24.
//

import SwiftUI

public struct CustomTabBar: TabItemDetails, View {

    @Binding var selectedTab: UUID
    public var tabItems: [TabItem]
    public var selectedForegroundColor: Color = .blue
    public var foregroundColor: Color = .gray
    public var font: Font = .caption
    
    public init(selectedTab: Binding<UUID>, tabItems: [TabItem], selectedForegroundColor: Color, foregroundColor: Color, font: Font) {
        self._selectedTab = selectedTab
        self.tabItems = tabItems
        self.selectedForegroundColor = selectedForegroundColor
        self.foregroundColor = foregroundColor
        self.font = font
    }
    
    public var body: some View {
        GeometryReader { geometry in
            HStack {
                ForEach(tabItems) { item in
                    Button(action: {
                        selectedTab = item.id
                    }) {
                        VStack {
                            Image(systemName: item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text(item.title)
                                .font(font)
                        }
                        .padding()
                        .foregroundColor(selectedTab == item.id ? selectedForegroundColor : foregroundColor)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, geometry.safeAreaInsets.bottom)
            .background(Color.white)
            .shadow(radius: 0.5)
        }
        .frame(height: 60)
    }
}
