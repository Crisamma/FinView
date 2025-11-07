//
//  EntrateUscite.swift
//  FinView
//
//  Created by Cristian Sammarco on 01/11/25.
//

import SwiftUI

struct EntrateUscite: View {
    
    @Binding var entrate: Double
    @Binding var uscite: Double
    
    
    @State private var dataEntrate: Date = Date()
    //@Binding var nomeEntrate: String
    
    @AppStorage("entrateMensili") private var entrateMensili: Double = 0.0
    
    var body: some View {
        NavigationStack{
            
            ZStack(alignment: .topLeading){
                Color.white.ignoresSafeArea()
                
                VStack(alignment: .leading){
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("Entrate").foregroundColor(.green).padding(.bottom).bold().font(.title2)
                            
                            Spacer()
                            
                            NavigationLink("+", destination: AggiungiEntrate())
                        }
                        
                        Text("Prossime Uscite").foregroundColor(.black).bold().padding(.bottom).font(.title3)
                        
                        Text("Affitto: 200").foregroundColor(.black).bold().italic()
                        
                        Button("Di più"){
                            
                        }.padding(.top)
                    }
                    .padding(15)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 4)
                    )
                    .frame(height: 200)
                    .padding()
                    
                }
            }
            .navigationTitle("Dettagli") // Mostra titolo nella barra
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EntrateUscite(entrate: .constant(100), uscite: .constant(50))
}
