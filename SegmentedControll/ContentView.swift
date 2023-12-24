//
//  ContentView.swift
//  SegmentedControll
//
//  Created by elsalvador on 23/12/23.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var favoriteColor = 0
    @State private var showAlert = false

    var body: some View {
        VStack {
            Picker("What is your favorite color?", selection: $favoriteColor) {
                Text("Red").tag(0)
                Text("Green").tag(1)
                Text("Blue").tag(2)
            }
            .pickerStyle(.segmented)

            Text("Valor: \(favoriteColor)")

            Button("Show Selection") {
                showAlert = true
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Tu selección:"), message: Text(getColorName()), dismissButton: .default(Text("OK")))
            }
        }
    }

    func getColorName() -> String {
        switch favoriteColor {
        case 0:
            return "Red"
        case 1:
            return "Green"
        case 2:
            return "Blue"
        default:
            return "Unknown Color"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
