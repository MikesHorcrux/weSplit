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
    var totalPerPerson: Double {
        //calulates the totals per person
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercetage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
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
                Section(header: Text("Tip amount")){
                    Picker("Tip Percentage", selection: $tipPercetage){
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                
                }
                Section{
                    Text("$\(totalPerPerson)")
                    
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
