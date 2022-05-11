//
//  ContentView.swift
//  Musync
//
//  Created by William Birdsall on 1/5/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSettings = false
    
    var body: some View {
        if(showingSettings) {
            ZStack {
                SettingsView()
                Button("\(Image(systemName: "xmark"))") {
                    showingSettings = false
                }
                .font(.system(size: 32))
                .position(x: UIScreen.main.bounds.size.width - 50, y: 25)
                .foregroundColor(.gray)
            }
        } else {
            ZStack {
                TabView {
                    BarsToMsView()
                    HzToSecView()
                    NoteToHzView()
                }
                .edgesIgnoringSafeArea(.all)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                .onAppear {
                    setupAppearance()
                }
                
                Button("\(Image(systemName: "slider.horizontal.3"))") {
                    showingSettings = true
                }
                .font(.system(size: 32))
                .position(x: UIScreen.main.bounds.size.width - 50, y: 25)
                .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}

func setupAppearance() {
  UIPageControl.appearance().currentPageIndicatorTintColor = .black
  UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
}
