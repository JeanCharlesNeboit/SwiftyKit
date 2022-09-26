//
//  UnitFlowVolume.swift
//  
//
//  Created by Jean-Charles Neboit on 11/09/2022.
//

import Foundation

// swiftlint:disable force_cast
public class UnitFlowVolume: Dimension {
    public override class func baseUnit() -> Self {
        literPerMinute as! Self
    }

    public static let literPerMinute = UnitFlowVolume(symbol: "L/min", converter: UnitConverterLinear(coefficient: 1))
    public static let cubicMeterPerHour = UnitFlowVolume(symbol: "m3/h", converter: UnitConverterLinear(coefficient: 1000/60))
}
