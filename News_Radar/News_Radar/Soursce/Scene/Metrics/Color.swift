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
    case green
    
    
    var color: UIColor {
        
        switch self {
        case .black:
            return #colorLiteral(red: 0.274925679, green: 0.2983170152, blue: 0.31075418, alpha: 1)
        case .blue:
            return #colorLiteral(red: 0.6235294118, green: 0.8, blue: 0.8745098039, alpha: 1)
        case .purpl:
            return #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        case .red:
            return #colorLiteral(red: 0.6666666865, green: 0.1628500727, blue: 0.2998337174, alpha: 1)
        case .grey:
            return #colorLiteral(red: 0.5490196347, green: 0.5490196347, blue: 0.5490196347, alpha: 1)
        case .white:
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case .yellow:
            return #colorLiteral(red: 0.9019607843, green: 0.7882352941, blue: 0.6666666667, alpha: 1)
        case .green:
            return #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        }
    }
}
