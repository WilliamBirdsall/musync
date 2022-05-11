//
//  HzToSecView.swift
//  Musync
//
//  Created by William Birdsall on 1/5/22.
//

import SwiftUI

struct HzToSecView: View {
    var blue = Color(red: 0.462, green: 0.541, blue: 0.941)
    @State private var bars:String = "1"
    
    var body: some View {
        let barsDouble = ((Double(bars) != nil) ? Double(bars)! : 0.0)
        let hz = BarConverter(bars: barsDouble).hz
        
        let content = {
            VStack(spacing: 0) {
                TextField("", text: $bars)
                    .keyboardType(.numbersAndPunctuation)
                    .frame(width: 100.0, height: 100.0)
                    .foregroundColor(.white)
                    .font(Font.custom("Inter-Vari", size: 56.0))

                Text(bars == "1" ? "bar" : "bars")
                    .foregroundColor(.white)
                    .font(Font.custom("Inter-Vari", size: 32.0))
            }
        }
        
        let contentTwo = {
            VStack {
                Text(String(format: "%.2f", hz))
                    .font(Font.custom("Inter-Vari", size: 56.0))
                Text("hz")
                    .font(Font.custom("Inter-Vari", size: 32.0))
            }
        }
        let bottomLabel = {
            Text("Bar \(Image(systemName: "arrow.forward")) Hz")
        }
        
        SplitView(topColor: blue, bottomColor: .white, content: content, contentTwo: contentTwo, bottomLabel: bottomLabel)
    }
}

struct HzToSecView_Previews: PreviewProvider {
    static var previews: some View {
        HzToSecView()
    }
}
