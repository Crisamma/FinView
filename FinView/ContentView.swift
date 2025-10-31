//
//  ContentView.swift
//  FinView
//
//  Created by Cristian Sammarco on 30/10/25.
//

import SwiftUI // 1. Importa il framework di Apple
import Charts

struct ContentView: View { // 2. La tua schermata
    
    @State private var isEditingIsybank = false
    @State private var isyBank: Int = 0
    
    @State private var isEditingTradeRepublic = false
    @State private var tradeRepublic: Int = 0
    
    @State private var isEditingSplitWise = false
    @State private var splitWise: Int = 0
    
    @State private var isEditingContanti = false
    @State private var contanti: Int = 0
    
    @State private var editingText: String = ""
    
    @State private var entrate: Double = 75
    @State private var uscite: Double = 100
    
    
    var saldoTotale: Int {isyBank + tradeRepublic + splitWise + contanti}
    
    var body: some View { // 3. La proprietà body (il contenuto visuale)
        
        let activities: [Activity] = [
            .init(type: .carta, balance: tradeRepublic),
            .init(type: .carta, balance: isyBank),
            .init(type: .carta, balance: splitWise),
            .init(type: .carta, balance: contanti)
        ]
        
        let massimo = entrate + uscite
        
        ZStack {
            //Color.white.ignoresSafeArea() //colore background

            VStack(alignment: .leading) { //VStack per inserire i testi
                VStack(alignment: .leading) {
                    
                    //Testo Saldo totale
                    Text("Saldo Totale")
                        .bold()
                        .italic()
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.top)
                        .padding(.horizontal)
                    
                    HStack {
                        
                        //Testo Saldo calcolato
                        Text("\(saldoTotale)")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.black)
                            //.padding(.leading)
                        
                        //Testo €
                        Text("€")
                            .bold()
                            .foregroundColor(.black)
                            .font(.title2)
                        //.frame(width: 1, height: 1, alignment: .center)
                        
                    }.padding(.bottom)
                        .padding(.horizontal)
                }
                .padding(.horizontal) // ← distacco per il testo
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    Color.green.ignoresSafeArea(edges: .horizontal) // ← estende lo sfondo oltre il padding
                )

                ScrollView(.vertical, showsIndicators: true){
                    VStack(spacing: 8) {
                        Chart(activities) {
                            activity in
                            BarMark(x: .value("Activity Type", activity.type.rawValue),
                                    y: .value("Duration", activity.balance))
                            .foregroundStyle(by: .value("Activity Type", activity.type.rawValue))
                            RuleMark(y: .value("Treshold", 100))
                            
                        }
                        //.background(Color.yellow.opacity(0.2))
                        .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 400)
                    }
                    .padding(.vertical, 5)
                }
                .padding(15)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 4)
                    )
                .frame(height: 200)
                .padding()
                
                VStack(alignment: .leading, spacing: 8) {
                    //TRADE REPUBLIC
                    HStack {
                        Text("Trade Republic")
                            .foregroundColor(.black)
                            .bold()

                        Spacer()
                        
                        if isEditingTradeRepublic {
                            TextField("Importo", text: $editingText)
                                .keyboardType(.numberPad)
                                .textFieldStyle(.roundedBorder)
                                .frame(maxWidth: 120)
                        } else {
                            Text("\(tradeRepublic)")
                                .foregroundColor(.black)
                                .bold()
                        }
                        Text("€").bold().foregroundColor(.black)

                        Button(isEditingTradeRepublic ? "Fine" : "Modifica") {
                            if isEditingTradeRepublic {
                                // Try convert editingText to Int when finishing
                                if let value = Int(editingText.trimmingCharacters(in: .whitespacesAndNewlines)) {
                                    tradeRepublic = value
                                    print(tradeRepublic)
                                }
                            } else {
                                // Entering edit mode: preload current value
                                editingText = String(tradeRepublic)
                            }
                            isEditingTradeRepublic.toggle()
                        }
                    }.padding(.vertical, 20)
                    
                    //ISYBANK
                    HStack {
                        Text("IsyBank")
                            .foregroundColor(.black)
                            .bold()
                        
                        Spacer()
                
                        if isEditingIsybank {
                            TextField("Importo", text: $editingText)
                                .keyboardType(.numberPad)
                                .textFieldStyle(.roundedBorder)
                                .frame(maxWidth: 120)
                        } else {
                            Text("\(isyBank)")
                                .foregroundColor(.black)
                                .bold()
                        }
                        Text("€").bold().foregroundColor(.black)
                        
                        Button(isEditingIsybank ? "Fine" : "Modifica") {
                            if isEditingIsybank {
                                // Try convert editingText to Int when finishing
                                if let value = Int(editingText.trimmingCharacters(in: .whitespacesAndNewlines)) {
                                    isyBank = value
                                    print(isyBank)
                                }
                            } else {
                                // Entering edit mode: preload current value
                                editingText = String(isyBank)
                            }
                            isEditingIsybank.toggle()
                        }
                    }.padding(.bottom, 20)
                    
                    //SplitWise
                    HStack {
                        Text("SplitWise")
                            .foregroundColor(.black)
                            .bold()
                        
                        Spacer()
                
                        if isEditingSplitWise {
                            TextField("Importo", text: $editingText)
                                .keyboardType(.numberPad)
                                .textFieldStyle(.roundedBorder)
                                .frame(maxWidth: 120)
                        } else {
                            Text("\(splitWise)")
                                .foregroundColor(.black)
                                .bold()
                        }
                        Text("€").bold().foregroundColor(.black)
                        
                        Button(isEditingSplitWise ? "Fine" : "Modifica") {
                            if isEditingSplitWise {
                                // Try convert editingText to Int when finishing
                                if let value = Int(editingText.trimmingCharacters(in: .whitespacesAndNewlines)) {
                                    splitWise = value
                                    print(splitWise)
                                }
                            } else {
                                // Entering edit mode: preload current value
                                editingText = String(splitWise)
                            }
                            isEditingSplitWise.toggle()
                        }
                    }.padding(.bottom, 20)
                    
                    //Contanti
                    HStack {
                        Text("Contanti")
                            .foregroundColor(.black)
                            .bold()
                        
                        Spacer()
                
                        if isEditingContanti {
                            TextField("Importo", text: $editingText)
                                .keyboardType(.numberPad)
                                .textFieldStyle(.roundedBorder)
                                .frame(maxWidth: 120)
                        } else {
                            Text("\(contanti)")
                                .foregroundColor(.black)
                                .bold()
                        }
                        Text("€").bold().foregroundColor(.black)
                        
                        Button(isEditingContanti ? "Fine" : "Modifica") {
                            if isEditingContanti {
                                // Try convert editingText to Int when finishing
                                if let value = Int(editingText.trimmingCharacters(in: .whitespacesAndNewlines)) {
                                    contanti = value
                                    print(contanti)
                                }
                            } else {
                                // Entering edit mode: preload current value
                                editingText = String(contanti)
                            }
                            isEditingContanti.toggle()
                        }
                    }.padding(.bottom, 20)
                    
                }
                .padding(15)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 4)
                    )
                .padding()
                
                VStack(alignment: .leading){
                    
                    HStack(){
                        Text("Analisi delle Spese").bold().foregroundColor(.black)
                        Spacer()
                        Button("Vai alla sezione"){
                            
                        }
                    }.padding(.vertical)
                    
                    Text("Entrate").bold().foregroundColor(.black)
                    
                    ProgressBar(
                        valore: entrate / massimo,
                        colore: .green
                    ).padding(.bottom, 20)
                    
                    Text("Uscite").bold().foregroundColor(.black)
                    
                    ProgressBar(
                        valore: uscite / massimo,
                        colore: .red
                    ).padding(.bottom, 20)
                }
                .padding(15)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 4)
                    )
                .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 200)
                .padding()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            //.padding()
            .background(
                Image("sfondoHomePage")
                    //.resizable()          // permette di ridimensionarla
                    .scaledToFill()       // fa riempire l’area
            )
            
            
        }
        
    }
}

enum ActivityType: String {
    case carta
}

struct Activity: Identifiable {
    let id = UUID()
    let type: ActivityType
    let balance: Int
}

struct ProgressBar: View {
    var valore: Double
    var colore: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 10)
                
                Capsule()
                    .fill(colore)
                    .frame(width: geometry.size.width * valore,
                           height: 10)
            }
        }
        .frame(height: 10)
        
    }
}

#Preview { // 4. La funzione di Anteprima (Preview)
    ContentView()
}
