//
//  ContentView.swift
//  Azaan
//
//  Created by Nihal Islam on 26/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var timeManager = TimeManager()
    @State var ccText = ""
    
    
    var body: some View {
            ZStack {
                Image("Mosque")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack() {
                        TextField("Address",
                                  text: $ccText,
                                  onCommit: {
                                    if (ccText != "") {
                                        timeManager.fetchData(cityCountry: ccText)
                                        }
                                }
                        )
                        .frame(width: .infinity, height: 30.0)
                            .textFieldStyle(PlainTextFieldStyle())
                            .background(.white.opacity(0.4))
                            .cornerRadius(10)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 0))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                        Button(action: {
                            // some code
                        }) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .bold()
                        }
                    }
                    Spacer()
                    VStack(alignment: .listRowSeparatorLeading, spacing: 10) {
                        RoundedRectangle(cornerRadius: 10)
                            .opacity(0.4)
                            .overlay(Text("Fajr  \(timeManager.timeModel.Fajr)")
                                .bold()
                                .font(.title)
                                .foregroundColor(.black)
                            )
                        RoundedRectangle(cornerRadius: 10)
                            .opacity(0.4)
                            .overlay(Text("Dhuhur  \(timeManager.timeModel.Dhuhr)")
                                .bold()
                                .font(.title)
                                .foregroundColor(.black)
                            )
                        RoundedRectangle(cornerRadius: 10)
                            .opacity(0.4)
                            .overlay(Text("Asr  \(timeManager.timeModel.Asr)")
                                .bold()
                                .font(.title)
                                .foregroundColor(.black)
                            )
                        RoundedRectangle(cornerRadius: 10)
                            .opacity(0.4)
                            .overlay(Text("Maghrib  \(timeManager.timeModel.Maghrib)")
                                .bold()
                                .font(.title)
                                .foregroundColor(.black)
                            )
                        RoundedRectangle(cornerRadius: 10)
                            .opacity(0.4)
                            .overlay(Text("Isha  \(timeManager.timeModel.Isha)")
                                .bold()
                                .font(.title)
                                .foregroundColor(.black)
                            )
                    }
                    .foregroundColor(.white)
                    .frame(height: 400)

                Spacer()
                }
                .padding()
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
