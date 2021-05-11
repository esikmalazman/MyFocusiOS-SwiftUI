//
//  ContentView.swift
//  My Focus
//
//  Created by Ikmal Azman on 09/05/2021.
//

// TODOS : 1. Core Data 2.Keyboard resign after return or touch outside textfield

import SwiftUI

struct BaseVC: View {
    init()
    {
        
        //Use this to set background color  for navaigation view
//        UITableView.appearance().backgroundColor = UIColor(red: 0.99, green: 1.00, blue: 0.99, alpha: 1)
        UITableView.appearance().backgroundColor = UIColor(red: 0.99, green: 1.00, blue: 0.99, alpha: 1)
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(red: 0.20, green: 0.32, blue: 0.53, alpha: 1.00)]
    }
    // Observed object, allow to watch the object for any changes announcments
    @ObservedObject var myFocus = MyFocus()
    @State var changeText : String = ""
    var body: some View
    {
        
        NavigationView
        {
            ZStack
            {
                Color(red: 0.99, green: 1.00, blue: 0.99)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    List{
                        ForEach(myFocus.items, id: \.id )
                        { myFocusList in
                            Text(myFocusList.list)
                                .padding()
                                .frame(alignment : .leading)
            
                        
                                
                            
                            
                        }//Slide to delete
                        .onDelete(perform: { indexSet in
                            crossList(at: indexSet)
                        })
                        
                        
                        
                    }
                    .listStyle(InsetGroupedListStyle())

                    
                    Spacer()
                    
                    
                    
                    
                    
                    
                    Text("Swipe to delete your focus")
                        .fontWeight(.ultraLight)
                        .padding(.top)
                        .font(.system(size: 12))
                    HStack
                    {
                        
                        TextField("What your Focus", text: $changeText)
                            .textFieldStyle(
                                RoundedBorderTextFieldStyle())
                            .cornerRadius(25)
                            .ignoresSafeArea(.keyboard, edges: .bottom)
                        
                        Button(action:
                                {
                                    //Identify if it is empty
                                    if !changeText.isEmpty
                                    {
                                        let list = MyFocusItem(list: changeText)
                                        self._myFocus.wrappedValue.items.append(list)
                                        changeText = ""
                                    }
                                    
                                })
                        {
                            Image(systemName: "plus")
                        }
                        
                    }
                    
                    .padding(.horizontal)
                }
                
                
                
            }
            
            
            
            .navigationTitle("My Focus")
        }
        
        
        
        
    }
    
    
    func crossList(at offsets : IndexSet)
    {
        
        myFocus.items.remove(atOffsets: offsets)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BaseVC()
    }
}


