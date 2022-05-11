//
//  NoteToHzView.swift
//  Musync
//
//  Created by William Birdsall on 1/5/22.
//

import SwiftUI

struct NoteToHzView: View {
    let green = Color(red: 0.631, green: 0.886, blue: 0.592)
    @State private var octave:String = "4"
    
    var body: some View {
        let content = {
            VStack() {
                HStack {
                    Text("C")
                    TextField("", text: $octave)
                        .keyboardType(.numbersAndPunctuation)
                }
                .frame(width: 100.0, height: 100.0)
                .foregroundColor(.white)
                .font(Font.custom("Inter-Vari", size: 56.0))
                
                Text("octave")
                    .foregroundColor(.white)
                    .font(Font.custom("Inter-Vari", size: 32.0))
            }
        }
        
        let contentTwo = {
            KeyChartView(fgColor: green, bgColor: .white, octave: octave)
        }
        
        let bottomLabel = {
            Text("Note \(Image(systemName: "arrow.forward")) Hz")
        }
        
        SplitView(topColor: green, bottomColor: .white, content: content, contentTwo: contentTwo, bottomLabel: bottomLabel)
    }
    
}

struct NoteToHzView_Previews: PreviewProvider {
    static var previews: some View {
        NoteToHzView()
.previewInterfaceOrientation(.portrait)
        
    }
}
