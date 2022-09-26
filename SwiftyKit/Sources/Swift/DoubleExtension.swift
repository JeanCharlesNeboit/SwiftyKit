//
//  DoubleExtension.swift
//  
//
//  Created by Jean-Charles Neboit on 27/05/2022.
//

import Foundation

extension Double {
    public func toRadian() -> Double {
        self * Double.pi/180
    }

    public func toDegree() -> Double {
        self * 180.0/Double.pi
    }

    public func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }

    public func removeTrailingZeros() -> String {
        truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
