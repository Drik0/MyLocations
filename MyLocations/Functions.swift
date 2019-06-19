//
//  Functions.swift
//  MyLocations
//
//  Created by Gerson Costa on 17/06/2019.
//  Copyright © 2019 Gerson Costa. All rights reserved.
//

import UIKit

let applicationDocumentsDirectory: URL = {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    return paths[0]
}()

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: run)
}

