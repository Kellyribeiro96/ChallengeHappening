//
//  AddTaskView.swift
//  It's Happening
//
//  Created by Kelly Karen Ribeiro on 10/12/24.
//

import SwiftUI

struct AddTaskView: View {
    @State private var task: String = ""
    @State private var taskType: Int = 0
    @Binding var nowTasks: [String]
    @Binding var laterTasks: [String]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Text ("Add Tasks").padding(.bottom, 25)
                    .foregroundColor(.black)
                    .bold()
                
                Picker("taskType", selection: $taskType) {
                    Text("Now").tag(0)
                    Text("Later").tag(1)
                }.pickerStyle(.segmented).padding()
                
                
                VStack{  TextField("Let's Get Things Done!",text: $task)
                        .padding()
                    Spacer()
                    
                    
                }.frame(width: 350, height: 400)
                    .background(RoundedRectangle(cornerRadius: 10).fill(taskType == 0 ? .myBabyPink : .myBabyBlue))
               
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button("Save"){saveTask()
                    }
                
                }
                ToolbarItem(placement: .topBarLeading){
                    Button("Cancel"){
                        cancelTask()
                    }
                }
            }
        }
    }
    
    private func cancelTask() {
        dismiss()
    }
    private func saveTask() {
        
        if taskType == 0 { nowTasks.append(task) }
        else {laterTasks.append(task)}
        dismiss()
    }
}



 


 
    



#Preview {
    AddTaskView(nowTasks: .constant([]), laterTasks:.constant([]))
}
 

