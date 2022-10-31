//
//  ContentView.swift
//  uikit to swiftui
//
//  Created by Александр on 31.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alert = false

    @State private var targetValue = 50
    @State private var currentValue = 50.0
    
    @State var value: Float = 0.1
    
    var body: some View {
        
        VStack {
            VStack {
                Text("Нужно \(targetValue)")
                .padding()
                HStack {
                    Text("0")
                    KitInSwift(value: $value, alpha: CGFloat(currentValue), colorSlider: .blue)
                    Text("100")
                }
            Button("Проверка") {
                alert = true
            }
            .alert("Очки: \(computeScore())", isPresented: $alert, actions: {})
            .padding()
                
                Button("Сбросить") {
                    targetValue = Int.random(in: 1...100)
                }
            }
        }
    }
        
    private func computeScore() -> Int {
            let difference = abs(targetValue - lround(currentValue))
            return 100 - difference
        }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
