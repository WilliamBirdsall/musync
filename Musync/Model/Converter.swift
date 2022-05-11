//
//  Converter.swift
//  Musync
//
//  Created by William Birdsall on 1/5/22.
//

import SwiftUI

class Converter {
}

class BarConverter: Converter {
    var bars:Double
    var ms:Double {
        get {
            @AppStorage("bpm") var userBpm: Int = 120
            return ceil(((self.bars * 4.0) / (Double(userBpm) / 60.0)) * 1000.0)
        }
    }
    var s:Double {
        return  self.ms / 1000.0
    }
    var hz:Double {
        get {
            return 1.0 / self.s
        }
    }
    
    init(bars:Double) {
        self.bars = bars
    }
}

class MIDINoteConverter: Converter {
    var midiNotes: Dictionary<String, Int> = [:]
    // 21 + (A * 0)
    var stdPitch:Double
    
    init(stdPitch:Double) {
        self.stdPitch = stdPitch
        super.init()
        self.generateMIDINotesDict()
    }
    
    private func generateMIDINotesDict() {
        let noteNames = [("A", 0),("A#", 1),("B", 2),("C", 3),("C#", 4),("D", 5),("D#", 6),("E", 7),("F", 8),("F#", 9),("G", 10),("G#", 11)]
        var octave = 0
        
        var midiNotes: Dictionary<String, Int> = [:]
        while(octave < 10) {
            for note in noteNames {
                let noteName = note.0
                let delta = note.1
                
                if(noteName == "C") {
                    octave += 1
                }
                
                var octaveOffset:Int
                
                if(["A", "A#", "B"].contains(noteName)) {
                    octaveOffset = noteNames.count * (octave == 0 ? 0 : octave)
                } else {
                    octaveOffset = noteNames.count * (octave == 0 ? 0 : octave - 1)
                }
                
                let noteNumber = 21 + delta + octaveOffset
                
                midiNotes[noteName + String(octave)] = noteNumber
            }
        }
        self.midiNotes = midiNotes
    }
    
    func getMIDINotePitch(midiNote:Int) -> Double {
        return self.stdPitch * Double(pow(2, ((Double(midiNote - 69)) / 12)))
    }
}
