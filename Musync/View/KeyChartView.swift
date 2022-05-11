//
//  KeyChartView.swift
//  Musync
//
//  Created by William Birdsall on 1/12/22.
//

import SwiftUI

struct KeyChartView: View {
    let fgColor: Color
    let bgColor: Color
    let octave: String
    
    let MNC = MIDINoteConverter(stdPitch: 440)
    let notes = ["C","C#","D","D#","E","F","F#","G","G#","A","A#", "B"]
    
    init(fgColor: Color, bgColor: Color, octave: String) {
        self.fgColor = fgColor
        self.bgColor = bgColor
        self.octave = octave
    }
    
    var body: some View {
        let sharpNotes = notes.reversed().filter { $0.contains("#") }
        
        let sharpNotesLower = sharpNotes[0...2]
        let sharpNotesUpper = sharpNotes[3...]
        let normalNotes = notes.reversed().filter { !$0.contains("#") }
        
        VStack {
            HStack {
                Spacer()
                // Sharp Notes
                VStack {
                    VStack {
                        ForEach(sharpNotesLower, id: \.self) { note in
                            let midiNoteNumber = MNC.midiNotes[note + octave]
                            let freq = MNC.getMIDINotePitch(midiNote: midiNoteNumber ?? 0)
                            let roundedFreq = String(format: "%.1f", freq)
                            
                            HStack {
                                Text(roundedFreq == "8.2" ? "-" : roundedFreq + " Hz")
                                    .font(Font.custom("Inter-Vari", size: 18.0))
                                ZStack {
                                    Circle()
                                        .fill(fgColor)
                                        .frame(width: 38, height: 38)
                                    Text(note)
                                        .font(Font.custom("Inter-Vari", size: 16.0))
                                        .foregroundColor(bgColor)
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: -5, trailing: 0))
                        }
                    }
                    Spacer()
                        .frame(height: 75)
                    VStack {
                        ForEach(sharpNotesUpper, id: \.self) { note in
                            let midiNoteNumber = MNC.midiNotes[note + octave]
                            let freq = MNC.getMIDINotePitch(midiNote: midiNoteNumber ?? 0)
                            let roundedFreq = String(format: "%.1f", freq)
                            
                            HStack {
                                Text(roundedFreq == "8.2" ? "-" : roundedFreq + " Hz")
                                    .font(Font.custom("Inter-Vari", size: 18.0))
                                ZStack {
                                    Circle()
                                        .fill(fgColor)
                                        .frame(width: 38, height: 38)
                                    Text(note)
                                        .font(Font.custom("Inter-Vari", size: 16.0))
                                        .foregroundColor(bgColor)
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: -5, trailing: 0))
                        }
                    }
                }
                
                // Normal Notes
                VStack {
                    ForEach(normalNotes, id: \.self) { note in
                        let midiNoteNumber = MNC.midiNotes[note + octave]
                        let freq = MNC.getMIDINotePitch(midiNote: midiNoteNumber ?? 0)
                        let roundedFreq = String(format: "%.1f", freq)
                        
                        HStack {
                            ZStack {
                                Circle()
                                    .stroke(fgColor)
                                    .frame(width: 38, height: 38)
                                Text(note)
                                    .font(Font.custom("Inter-Vari", size: 16.0))
                                    .foregroundColor(fgColor)
                            }
                            Text(roundedFreq == "8.2" ? "-" : roundedFreq + " Hz")
                                .font(Font.custom("Inter-Vari", size: 18.0))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: -3, trailing: 0))
                    }
                }
                Spacer()
            }
        }
        .foregroundColor(fgColor)
    }
}

struct KeyChartView_Previews: PreviewProvider {
    static var previews: some View {
        KeyChartView(fgColor: .black, bgColor: .white, octave: "4")
    }
}
