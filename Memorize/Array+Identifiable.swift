//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Alvin Ghouas on 7/22/20.
//  Copyright © 2020 Alvin Ghouas. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int {

        for index in 0..<self.count{
            if self[index].id == matching.id {
                return index
            }
        }
        
        return 0 //TODO
    }
    
}

