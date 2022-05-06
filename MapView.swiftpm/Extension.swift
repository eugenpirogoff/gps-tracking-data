//
//  File.swift
//  MapView
//
//  Created by Eugen Pirogoff on 06.05.22.
//

import Foundation

// safe collection
public extension RandomAccessCollection {
    subscript (safe index: Index) -> Element? {
        guard index >= startIndex, index < endIndex else {
            return nil
        }
        return self[index]
    }
}
