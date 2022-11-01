//
//  KitInSwift.swift
//  uikit to swiftui
//
//  Created by Александр on 31.10.2022.
//

import SwiftUI

struct KitInSwift: UIViewRepresentable {
    
    @Binding var value: Double
    let alpha: Int
    let colorSlider: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let sliderKit = UISlider()
        sliderKit.minimumValue = 0
        sliderKit.maximumValue = 100
        
        sliderKit.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didTapDone),
            for: .valueChanged
        )
        
        return sliderKit
    }

    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = colorSlider.withAlphaComponent(CGFloat(alpha) / 100)
    }
  
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension KitInSwift {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func didTapDone(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct KitInSwift_Previews: PreviewProvider {
    static var previews: some View {
        KitInSwift(value: .constant(10.0), alpha: Int(CGFloat(100)), colorSlider: .blue)
    }
}

