//
//  String+AddText.swift
//  MyLocations
//
//  Created by Gerson Costa on 27/06/2019.
//  Copyright © 2019 Gerson Costa. All rights reserved.
//

import Foundation

extension String {
    mutating func add(text: String?, separatedBy separator: String = "") {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
}
