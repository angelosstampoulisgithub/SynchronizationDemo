//
//  ContentView.swift
//  SynchronizationDemo
//
//  Created by Angelos Staboulis on 14/1/25.
//

import SwiftUI

struct ContentView: View {
    @State var number:String
    @State var fetchData:Int
    var body: some View {
        VStack{
            Text("Array is Filled with 10 numbers").frame(width:350,height:45,alignment:.leading)
            Text("Enter position of the array(number integer)").frame(width:350,height:45,alignment:.leading)
            TextField("Enter position of the array(number integer)", text:$number).frame(width:350,height:45,alignment:.leading)
            Button {
                if let getNumber = Int(number){
                    if let fetchNumber = (Singleton.shared.fetchData(forKey: getNumber)){
                        fetchData = fetchNumber
                    }
                }
            
            } label: {
                Text("Fetch Value")
            }
            Text("Value in \(number) fth position of the array is \(fetchData)").frame(width:350,height:45,alignment:.leading)

           
        }.onAppear {
            for item in 0..<10{
                Singleton.shared.storeData(item, forKey: item)
            }
        }
    }
}

#Preview {
    ContentView(number: "", fetchData: 0)
}
