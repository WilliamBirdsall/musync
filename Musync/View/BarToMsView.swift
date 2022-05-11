//
//  BarToMsView.swift
//  Musync
//
//  Created by William Birdsall on 1/5/22.
//

import SwiftUI

struct BarsToMsView: View {
    var red = Color(red: 0.976, green: 0.462, blue: 0.462)
    @State private var bars:String = "1"

    var body: some View {
        let barsDouble = ((Double(bars) != nil) ? Double(bars)! : 0.0)
        let ms = BarConverter(bars: barsDouble).ms
        
        let format = ms < 1000 ? "%.0f" : "%.2f"
        let timeValue = ms < 1000 ? ms : ms / 1000
        let timeLabel = ms < 1000 ? "ms" : "s"
        
        let content = {
            VStack(spacing: 0) {
                TextField("", text: $bars)
                    .keyboardType(.numbersAndPunctuation)
                    .frame(width: 100.0, height: 100.0)
                    .foregroundColor(.white)
                    .font(Font.custom("Inter-Vari", size: 56))

                Text(bars == "1" ? "bar" : "bars")
                    .foregroundColor(.white)
                    .font(Font.custom("Inter-Vari", size: 32.0))
            }
        }
        
        let contentTwo = {
            VStack {
                Text(String(format: format, timeValue))
                    .font(Font.custom("Inter-Vari", size: 56.0))
                Text(timeLabel)
                    .font(Font.custom("Inter-Vari", size: 32.0))
            }
        }
        let bottomLabel = {
            Text("Bar \(Image(systemName: "arrow.forward")) Ms")
        }
        
        SplitView(topColor: red, bottomColor: .white, content: content, contentTwo: contentTwo, bottomLabel: bottomLabel)
    }
}

struct BarToMsView_Previews: PreviewProvider {
    static var previews: some View {
        BarsToMsView()
.previewInterfaceOrientation(.portrait)
    }
}
