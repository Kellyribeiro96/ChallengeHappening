//
//  ContentView.swift
//  It's Happening
//
//  Created by Kelly Karen Ribeiro on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    @State  var nowTasks: [String] = ["Buy Groceries", "Pick up mom", "Make the bed"]
    @State  var laterTasks: [String] = ["Pay the bills", "Call Frank", "Laundry"]
    @State private var showModal: Bool = false
   // @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            
            VStack {
                Text ("Let's make things happen!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .italic()
                    .foregroundColor(.myOrange)
                
                
                
                //.padding(.top, 25)
                
                /*
                 Button(action: {
                 
                 }) {Image(systemName: "plus")
                 .font(.title2)
                 .padding()
                 }
                 */
                
                //LEADING = LEFT
                //TRAILING = RIGHT
                
                VStack(alignment: .leading) {
                    
                    HStack{
                        VStack{
                            Text("19th Dec 2024")
                                .font(.title)
                                .fontDesign(.serif)
                                .foregroundColor(.black)
                                .opacity(0.51)
                                .bold()
                            
                            Text("A thought for the day:")
                                .bold()
                                .italic()
                                .foregroundColor(.myThought)
                                .padding(.trailing)
                            
                        }
                        Spacer()
                    }
                    
                    Spacer()
                }.padding()
                    .frame(width:380, height: 170)
                    .background(RoundedRectangle(cornerRadius: 8).fill(.myTealCard))
                
                
                HStack{
                    VStack (alignment: .leading){
                        
                        VStack{
                            Text("NOW")
                                .font(.title3)
                                .foregroundColor(.myTealTexts)
                                .fontWeight(.heavy)
                        }.frame(width: 140)
                            .padding(.bottom,5)
                        // .background(.yellow)
                        
                       
                        
                        ForEach(nowTasks, id: \.self) { task in
                            HStack{
                                Image(systemName: "circle.fill")
                                    .font(.callout).foregroundStyle(Color.myPink)
                                Text(task)
                            }
                            
                        }
                        Spacer()
                        
                   /*
                        HStack{
                            Image(systemName: "circle.fill")
                                .font(.callout).foregroundStyle(Color.myPink)
                            Text("Buy groceries")
                        }
                        
                        HStack {
                            Image(systemName: "circle.fill")
                                .font(.callout).foregroundStyle(Color.myPink)
                            Text("Pick up mom at 4")
                        }
                        
                        HStack{
                            Image(systemName: "circle.fill")
                                .font(.callout).foregroundStyle(Color.myPink)
                            
                            Text("Pay bills")
                        }
                        */
                        
                    }.frame(width: 150, height: 200)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(.myBabyPink))
                    
                    
                    ///////////////////////////////////////////////////////////////////////
                    
                    VStack (alignment: .leading){
                        
                        VStack{
                            Text("LATER")
                                .font(.title3)
                                .foregroundColor(.myTealTexts)
                                .fontWeight(.heavy)
                        }.frame(width: 140)
                            .padding(.bottom,5)
                    
                          ForEach(laterTasks, id: \.self) { task in
                        HStack{
                            Image(systemName: "circle.fill")
                                .font(.callout).foregroundStyle(Color.myBlue)
                            Text(task)
                        }
                          }
                        Spacer()
                        
                        /*
                        HStack{
                            Image(systemName: "circle.fill")
                                .font(.callout).foregroundStyle(Color.myBlue)
                            Text("Buy groceries")
                        }
                        
                        HStack {
                            Image(systemName: "circle.fill")
                                .font(.callout).foregroundStyle(Color.myBlue)
                            Text("Pick up mom at 4")
                        }
                        
                        HStack{
                            Image(systemName: "circle.fill")
                                .font(.callout).foregroundStyle(Color.myBlue)
                            
                            Text("Pay bills")
                        }
                        
                        */
                    }.frame(width: 150, height: 200)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(.myBabyBlue))
                    
                    
                }
                Spacer()
                
                Divider().padding(.horizontal, 100)
                
                Spacer()
                
                VStack{
                    Text("Nothing planned? Let AI find you something creative to do!")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.myTealTexts)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width:380, height: 150)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.myChatGpt))
                }
                Spacer()
                /*
                 HStack {
                 Spacer()
                 
                 VStack { Image(systemName: "gear")
                 Text("Settings")
                 .font(.footnote)
                 
                 }
                 Spacer()
                 
                 VStack { Image(systemName: "waveform")
                 Text("Voice Memo")
                 .font(.footnote)
                 }
                 Spacer()
                 
                 VStack {Image(systemName: "list.bullet")
                 Text("List")
                 .font(.footnote)
                 
                 }
                 Spacer()
                 
                 
                 }.foregroundColor(.blue)
                 */
            }.toolbar{
                ToolbarItem(placement: .topBarTrailing)
                { Button {
                    showModal = true
                } label: {
                    Image(systemName: "plus")
                        .bold()
                }
                }
                
            }
            
            
        }.sheet(isPresented: $showModal) {
            AddTaskView(nowTasks: $nowTasks, laterTasks: $laterTasks)
        }

    }
}

#Preview {
    ContentView()
}
