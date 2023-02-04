//
//  BindingExtensions.swift
//  MVVM_SWIFTUI
//
//  Created by Renato on 04/02/23.
//

import SwiftUI

extension Binding {
    init<ObjectType: AnyObject>(to path: ReferenceWritableKeyPath<ObjectType, Value>, on object: ObjectType) {
        self.init(
            get: { object[keyPath: path] },set: { object[keyPath: path] = $0}
        ) //end self.init
    } //end init
} //end extension Binding
