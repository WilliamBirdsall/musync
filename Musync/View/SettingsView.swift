//
//  SettingsView.swift
//  Musync
//
//  Created by William Birdsall on 1/7/22.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("bpm") var bpm: Int = 120
    
    var body: some View {
        Form {
            Section(header: Text("Global")) {
                Stepper("BPM: \(bpm)", value: $bpm,
                        in: 50...200,
                        step: 1)
                .font(Font.custom("Inter-Vari", size: 18))
                .multilineTextAlignment(.trailing)
                .font(Font.custom("Inter-Vari", size: 18))
            }
            .font(Font.custom("Inter-Vari", size: 14))
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
