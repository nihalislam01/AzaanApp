//
//  timeManager.swift
//  Azaan
//
//  Created by Nihal Islam on 26/5/23.
//

import Foundation

class TimeManager: ObservableObject {
    
    let timeURL = "https://api.aladhan.com/v1/timingsByCity?"
    @Published var timeModel = TimeModel(Fajr: "", Dhuhr: "", Asr: "", Maghrib: "", Isha: "")
    
    func fetchData(cityCountry: String) {
        if cityCountry.contains(", ") {
            let cc = cityCountry.split(separator: ", ")
            let urlString = "\(timeURL)city=\(String(cc[0]))&country=\(String(cc[1]))"
            performRequest(with: urlString)
        } else {
            let cc = cityCountry.split(separator: ",")
            let urlString = "\(timeURL)city=\(String(cc[0]))&country=\(String(cc[1]))"
            performRequest(with: urlString)
        }
    }
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        do {
                            let decodedData = try decoder.decode(TimeData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.timeModel = TimeModel(Fajr: decodedData.data.timings.Fajr, Dhuhr: decodedData.data.timings.Dhuhr, Asr: decodedData.data.timings.Asr, Maghrib: decodedData.data.timings.Maghrib, Isha: decodedData.data.timings.Isha)
                            }
                        } catch {
                            print(error)
                            
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
