//
//  Storage.swift
//  vk
//
//  Created by Larisa on 12.07.2022.
//

import UIKit

class Storage: NSObject {
    static let shared = Storage()

    private override init() {
        super.init()
    }

    var myGroups = [Group]()
}
