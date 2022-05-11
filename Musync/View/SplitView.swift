//
//  SplitView.swift
//  Musync
//
//  Created by William Birdsall on 1/12/22.
//

import SwiftUI

struct SplitView<Content: View, ContentTwo: View, BottomLabel: View>: View {
    let content: () -> Content
    let contentTwo: () -> ContentTwo
    let bottomLabel: () -> BottomLabel
    
    let topColor: Color
    let bottomColor: Color
    

    init(topColor: Color, bottomColor: Color, @ViewBuilder content: @escaping () -> Content, @ViewBuilder contentTwo: @escaping () -> ContentTwo, @ViewBuilder bottomLabel: @escaping () -> BottomLabel) {
        self.topColor = topColor
        self.bottomColor = bottomColor
        self.bottomLabel = bottomLabel
        
        self.content = content;
        self.contentTwo = contentTwo;
    }
    
    
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .fill(topColor)
                VStack {
                    Spacer()
                    content()
                    Spacer()
                }
            }
            .background(topColor.edgesIgnoringSafeArea(.all))
            .foregroundColor(bottomColor)
            ZStack {
                Rectangle()
                    .fill(bottomColor)
                VStack {
                    Spacer()
                    contentTwo()
                    Spacer()
                    bottomLabel()
                }
            }
            .background(bottomColor.edgesIgnoringSafeArea(.all))
            .foregroundColor(topColor)
        }
        .multilineTextAlignment(.center)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct SplitView_Previews: PreviewProvider {
    static var previews: some View {
        SplitView(topColor: .black, bottomColor: .white, content: {Text("Content")}, contentTwo: {Text("Content Two")}, bottomLabel: {Text("Label")})
        
.previewInterfaceOrientation(.portrait)
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
