//
//  ContentView.swift
//  It's Happening
//
//  Created by Kelly Karen Ribeiro on 09/12/24.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @State  var nowTasks: [String] = ["Buy Groceries", "Pick up mom", "Make the bed"]
    @State  var laterTasks: [String] = ["Pay the bills", "Call Frank", "Laundry"]
    @State private var showModal: Bool = false
    @Environment(\.modelContext) var modelContext
    //@Query(filter: #Predicate{$0.taskType == .nowTasks}, sort: \ToDoTask.dateAdded) var nowTasks: [ToDoTask]
    
    

   // @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            
            VStack { 
                Text ("Let's make things happen!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .italic()
                    .foregroundColor(.myOrange)
                    .padding()
                    
                
            
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
                        VStack(alignment: .leading){
                            Text(Date.now.formatted(date: .abbreviated, time: .omitted))
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
                            SingleTaskView(taskName: task, taskType: 0)
                                .onLongPressGesture {
                                    nowTasks.removeAll()
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
                              SingleTaskView(taskName: task, taskType: 1)
                        
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
                    Text("Your daily challenge: Identify your top 3 priorities for the week.")
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
            .navigationTitle("Your Tasks")
            
            
            
        }.sheet(isPresented: $showModal) {
            AddTaskView(nowTasks: $nowTasks, laterTasks: $laterTasks)
        }

    }
}

#Preview {
    ContentView()
}


struct SingleTaskView: View {
    @State var nowTasks: String = ""
    @State var taskName: String = ""
    @State var taskDone: Bool = false
    @State var taskType: Int = 0
    
    var body: some View {
        HStack {
            
            Button {
                taskDone.toggle()
            } label: {
                
                if taskDone {
                Image(systemName: "checkmark.circle.fill")
                        .font(.callout).foregroundStyle(taskType == 0 ? Color.myPink : Color.myBlue)
                    
                } else{ Image(systemName: "circle.fill")
                    .font(.callout).foregroundStyle(taskType == 0 ? Color.myPink : Color.myBlue)}
            }
            Text(taskName)
        }
    }
    
}




