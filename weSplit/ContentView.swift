//
//  ContentView.swift
//  weSplit
//
//  Created by Mike  Van Amburg on 12/2/19.
//  Copyright © 2019 Mike Van Amburg. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercetage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(0..<20){
                            Text("\($0) people")
                        }
                    }
                }
                Section{
                    Text("$\(checkAmount)")
                }
            .navigationBarTitle("weSplit")
            }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
