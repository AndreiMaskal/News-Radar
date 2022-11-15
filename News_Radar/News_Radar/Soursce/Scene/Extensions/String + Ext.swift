//
//  String + Ext.swift
//  News_Radar
//
//  Created by Andrei Maskal on 07/11/2022.
//

extension String {
    func matches(_ regex: String) -> Bool {
        return range(of: regex, options:  .regularExpression, range: nil, locale: nil) != nil
    }
}
