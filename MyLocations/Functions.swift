//
//  Functions.swift
//  MyLocations
//
//  Created by Gerson Costa on 17/06/2019.
//  Copyright © 2019 Gerson Costa. All rights reserved.
//

import Foundation

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: run)
}
