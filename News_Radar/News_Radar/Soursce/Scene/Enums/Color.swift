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
    case red
    case grey
    case white
    case yellow
    
    
    var color: UIColor {
        
        switch self {
        case .black:
            return #colorLiteral(red: 0.274925679, green: 0.2983170152, blue: 0.31075418, alpha: 1)
        case .blue:
            return #colorLiteral(red: 0.6235359311, green: 0.8018248677, blue: 0.8762883544, alpha: 1)
        case .purpl:
            return #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        case .red:
            return #colorLiteral(red: 0.8711125851, green: 0.3173463345, blue: 0.3299358189, alpha: 1)
        case .grey:
            return #colorLiteral(red: 0.5490196347, green: 0.5490196347, blue: 0.5490196347, alpha: 1)
        case .white:
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case .yellow:
            return #colorLiteral(red: 0.9010485411, green: 0.78630656, blue: 0.6651161313, alpha: 1)
        }
    }
}
