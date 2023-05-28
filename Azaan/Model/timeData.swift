//
//  timeData.swift
//  Azaan
//
//  Created by Nihal Islam on 26/5/23.
//

import Foundation

//struct WeatherData: Codable {
//    let name: String
//    let main: Main
//    let weather: [Weather]
//}
//
//struct Main: Codable {
//    let temp: Double
//}
//
//struct Weather: Codable {
//    let description: String
//    let id: Int
//}


struct TimeData: Codable {
    let data: Data
}

struct Data: Codable {
    let timings: Timing
}

struct Timing: Codable {
    let Fajr: String
    let Dhuhr: String
    let Asr: String
    let Maghrib: String
    let Isha: String
}
