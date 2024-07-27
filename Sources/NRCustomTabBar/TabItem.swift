//
//  TabItem.swift
//  Learn
//
//  Created by Nirav Ramani on 26/07/24.
//

import Foundation
import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let view: AnyView
}

protocol TabItemDetails {
    var tabItems: [TabItem] { get set }
    var selectedForegroundColor: Color { get set }
    var foregroundColor: Color { get set}
    var font: Font { get set }
}
