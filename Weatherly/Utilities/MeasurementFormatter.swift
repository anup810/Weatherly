//
//  MeasurementFormatter.swift
//  Weatherly
//
//  Created by Anup Saud on 2024-07-09.
//

import Foundation

extension MeasurementFormatter{
    static func temperature(value: Double) ->String{
        let numberFormatetr = NumberFormatter()
        numberFormatetr.maximumFractionDigits = 0
         let formatter = MeasurementFormatter()
        formatter.numberFormatter = numberFormatetr
        
        let temp = Measurement(value: value, unit: UnitTemperature.kelvin)
        return formatter.string(from: temp)
    }
}
