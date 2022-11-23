//
//  Date + Extension.swift
//  NeoStore
//
//  Created by Neosoft on 18/11/22.
//

import Foundation

extension Date{
    func dateString(_ format: String) -> String{
       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
            
        
    }
}
