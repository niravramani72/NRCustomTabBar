//
//  TabItem.swift
//  Learn
//
//  Created by Nirav Ramani on 26/07/24.
//

import Foundation
import SwiftUI

public struct TabItem: Identifiable {
    public let id = UUID()
    public let title: String
    public let imageName: String
    public let view: AnyView
}

protocol TabItemDetails {
    var tabItems: [TabItem] { get set }
    var selectedForegroundColor: Color { get set }
    var foregroundColor: Color { get set}
    var font: Font { get set }
}
