//
//  ContentView.swift
//  ClassicCarGarage
//
//  Created by Erika Frison on 6/4/26.
//

import SwiftUI
// MARK: - ClassicCar Model
struct ClassicCar : Identifiable {
    
    let id = UUID()  // Universal Unique Identifier
    let name: String
    let year: Int
    var nickname: String?
    // the ? makes it an optional string
    var price: Double = 0.0
    var description: String{
        "\(year) \(name)  \(nickname ?? "None") - $\(price)"
    // the ?? is an nil coalesing operator
    }
    
} //end ClassicCar Struct



// MARK: - ContentView
struct ContentView: View {
    
   @State var cars : [ClassicCar] = []
    var showingAddCar = false
   @State var showCars = false
    
    var body: some View {
        
        NavigationStack{
            VStack {
                Spacer()
                if showCars{
        
                    List {
                        ForEach(cars){ oneCar in
                            
                            HStack{
                                Image(systemName: "car.fill")
                                Text(oneCar.description)
                            }
                            
                        }
                    }

                } else {
                    Text("Garage Closed")
                        .font(.title2)
                        .foregroundColor(.gray.opacity(0.7))
                    
                    Spacer()
                }// end if

            } // end v stack
            .padding()
            .navigationTitle("Classic Car Garage")
            .task {
                if cars.isEmpty{
                    cars = generateCars()
                }
            }

            Button {
                showCars.toggle()
                
            } label: {
                Text ("Show Cars")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .padding()
                    .background(showCars ? .green.opacity(0.7) : .red.opacity(0.7))
                    .cornerRadius(10)
            }
            
            
            
        }// end Nav Stack
    } // end body
    func generateCars() -> [ClassicCar] {
        
        let carData : [ (String, Int, String?, Double)] =
        [
            ("Ford", 1967, "Mustang", 1000.00),
            ("Chevrolet Nova", 2020, "Sleeper", 2000.00),
            ("Pontiac GT", 2020, "GOAT", 3000.00)
        ]
        
        return carData.map { ClassicCar(name: $0.0, year: $0.1, nickname:$0.2, price: $0.3)}
    }
}// end contentView

#Preview {
    ContentView()
}
