//
//  AggiungiEntrate.swift
//  FinView
//
//  Created by Cristian Sammarco on 01/11/25.
//

import SwiftUI

struct AggiungiEntrate: View {
    
    @State private var dataSelezionata = Date()
    @State private var nomeEntrate: String = ""
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.white.ignoresSafeArea()
            
            VStack(alignment: .leading){
                
                Text("Aggiungi Entrate").foregroundColor(.black).padding(.horizontal).padding(.top).bold().font(.title2)

                DatePicker("Scegli una data",
                    selection: $dataSelezionata,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.1))
                        .shadow(color: .white, radius: 8, x: 0, y: 4)
                )
                .padding(.horizontal).scaleEffect(0.85, anchor: .leading)
                
                Text("Data evento:").padding(.horizontal)
                        Text("\(dataSelezionata.formatted(date: .long, time: .omitted))")
                    .bold().padding(.horizontal).padding(.bottom)
                
                TextField("Nome evento", text: $nomeEntrate)
                
            }
        }.preferredColorScheme(.light)
    }
}

#Preview {
    AggiungiEntrate()
}
