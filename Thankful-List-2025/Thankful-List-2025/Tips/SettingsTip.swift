//
//  SettingsTip.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 8/6/25.
//

import Foundation
import TipKit

public struct SettingsTip: Tip {
    public var title: Text { Text("Change Settings") }
    public var message: Text? { Text("You can set reminders and delete your Thanks here." )}
    public var image: Image? { Image(systemName: "arrowshape.down.fill") }
}
