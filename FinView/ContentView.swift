//
//  ContentView.swift
//  FinView
//
//  Created by Cristian Sammarco on 30/10/25.
//

import SwiftUI // 1. Importa il framework di Apple
import Charts

struct ContentView: View { // 2. La tua schermata
    var body: some View { // 3. La proprietà body (il contenuto visuale)
        ZStack {
            Color.white.ignoresSafeArea() //colore background

            VStack(alignment: .leading) { //VStack per inserire i testi
                
                //Testo Saldo totale
                Text("Saldo Totale")
                    .bold()
                    .italic()
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                
                HStack {
                    
                    //Testo Saldo calcolato
                    Text("2010")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.black)
                        .padding(.leading)
                        //.frame(width: 1, height: 1, alignment: .center)
                    
                    //Testo €
                    Text("€")
                        .bold()
                        .foregroundColor(.black)
                        .font(.title2)
                        //.frame(width: 1, height: 1, alignment: .center)
                        
                }
                
                /*HStack{ //Uso HStack per centrare la Card
                    
                    Spacer() //Spacer per centrare
                    
                    //Card
                    VStack {
                        Text("Prova")
                            .foregroundColor(.black)
                    }
                    .frame(width: 360, height: 250, alignment: .center)
                    .padding(.leading)
                    .background(RoundedRectangle(cornerRadius: 20, style: .circular)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.3), radius: 12, x: 0, y: 6))
                    
                    Spacer() //Spacer per centrare
                }
                .padding()*/
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            
        }
        
    }
}


#Preview { // 4. La funzione di Anteprima (Preview)
    ContentView()
}
