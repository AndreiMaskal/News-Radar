//
//  Color.swift
//  News_Radar
//
//  Created by Andrei Maskal on 01/11/2022.
//

import UIKit

enum Color {
    case black
    case blue
    case purpl
    
    var color: UIColor {
        
        switch self {
        case .black:
            return #colorLiteral(red: 0.01178014278, green: 0.01575395651, blue: 0.01988533884, alpha: 1)
        case .blue:
            return #colorLiteral(red: 0.04705882353, green: 0.6509803922, blue: 0.9921568627, alpha: 1)
        case .purpl:
            return #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }
    }
}
