//
//  String+Extension.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import Foundation

extension String {
    static let empty = ""
    
    func localizable() -> String {
        return NSLocalizedString(self, comment: self)
    }
}
