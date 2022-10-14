//
//  ContentView.swift
//  waitlisthelper-skeleton
//
//  Created by Jordan Yee on 1/19/22.
//

import SwiftUI

struct ContentView: View {
    @State private var waitlistPlace: Double = 0
    @State private var classSize: Double = 0
    @State private var calculate = false
    @State var probability = 0
    @State var text = ""
    
    var body: some View {
        NavigationView {
            
            TabView {
                
                ZStack {
                    Image("calculate_background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    VStack {
                        Spacer()
                        Text("WILL YOU GET OFF THE WAITLIST")
                            .font(.system(size:40, weight: .bold))
                            .foregroundColor(.blue)
                            .padding()
                        
                        Spacer()
                        HStack {
                            Text("Place on Waitlist: \(waitlistPlace, specifier: "%.f")")
                            
                            Spacer()
                        }
                        Slider(value: $waitlistPlace, in: 0...1000, step: 1)
                            .padding()
                        
                        HStack {
                            Text("Class Size: \(classSize, specifier: "%.f")")
                            
                            Spacer()
                        }
                        Slider(value: $classSize, in: 0...1000, step: 1)
                            .padding()
                        
                        NavigationLink(destination: ResultView(prob: $probability, feedback: $text), isActive: $calculate) { EmptyView() } .padding()
                        
                        Button("CALCULATE") {
                            calculateProbability(waitlistPlace: Int(waitlistPlace), classSize: Int(classSize))
                            
                            text = getFeedbackText()
                            calculate = true
                        } .buttonStyle(CustomButton())
                        
                        Spacer()
                        
                    } .padding()
                    
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                                    .tabItem{
                                        Image(systemName: "house.fill")
                                        Text("Home")
                                    }
                
                ZStack {
                    Image("calculate_background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    VStack {
                        HStack {
                            Text("Courses")
                                .font(.system(size: 50, weight: .bold))
                                .foregroundColor(Color.blue)
                                .padding()
                            Spacer()
                        } .padding()
                        
                        Spacer()
                    }
                    VStack {
                        HStack {
                            Text("Waitlists")
                                .font(.system(size: 50, weight: .bold))
                                .foregroundColor(Color.blue)
                                .padding()
                            Spacer()
                        } . padding()
                    }
                }
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Courses")
                }
            }
        }
                
                
            
                
        }
    func calculateProbability(waitlistPlace: Int, classSize: Int) {
        let tenth = classSize / 10
        if (waitlistPlace <= tenth) {
            probability = 100
        } else if (waitlistPlace > tenth * 2) {
            probability = 0
        } else {
            probability = 100 - Int(((Float(waitlistPlace - tenth) / Float(tenth)) * 100))
        }
    }
    
    func getFeedbackText() -> String {
        for tuple in feedbackModel {
            if probability >= tuple.0 {
                return tuple.1
            }
        }
        return "Error"
    }
}

struct ResultView: View {
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    @Binding var prob: Int
    @Binding var feedback: String
    
    
    var body: some View {

        ZStack {
            Color(red: 50/255, green: 141/255, blue: 168/255)
                .ignoresSafeArea()
            
            Image("result_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {self.presentation.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                    }
                    .navigationBarHidden(true)
                    
                    Spacer()
                } .padding()
                Spacer()
                Text("PROBABILITY")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("\(prob)%")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(Color.white)
                Text("\(feedback)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.white)
                Spacer()
                Spacer()
            } .padding()
        }
        
    }
}

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color(red: 0.2, green: 0.1, blue: 0.8))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
