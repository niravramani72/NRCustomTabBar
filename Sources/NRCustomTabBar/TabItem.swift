//
//  TabItem.swift
//  Learn
//
//  Created by Nirav Ramani on 26/07/24.
//

import SwiftUI

public struct TabItem: Identifiable {
    public let id = UUID()
    public let title: String
    public let imageName: String
    public let view: AnyView
    
    public init(title: String, imageName: String, view: AnyView) {
        self.title = title
        self.imageName = imageName
        self.view = view
    }
}

protocol TabItemDetails {
    var tabItems: [TabItem] { get set }
    var selectedForegroundColor: Color { get set }
    var foregroundColor: Color { get set}
    var font: Font { get set }
}
