//
//  NewContestsUIView.swift
//  app966
//
//  Created by Dias Atudinov on 22.10.2024.
//

import SwiftUI

struct NewContestsUIView: View {
    @ObservedObject var viewModel: ContestsViewModel
    @State var date = ""
    @State var location = ""
    @State var height = ""
    @State var note = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                ZStack {
                    HStack {
                        
                        Text("Add to calendar")
                            .font(.system(size: 17, weight: .semibold))
                        
                    }
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                        }
                        Spacer()
                    }
                }.foregroundColor(.white).padding(.horizontal).padding(.top)
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(spacing: 16) {
                        VStack {
                            HStack {
                                Text("Select date")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            ZStack {
                                if date.isEmpty {
                                    HStack {
                                        Text("0").foregroundColor(.white.opacity(0.5))
                                        Spacer()
                                    }.padding(.horizontal, 12)
                                }
                                
                                TextField("", text: $date)
                                    .foregroundColor(.white)
                                    .padding(12).padding(.vertical, 5)
                                    .background(Color.white.opacity(0.3))
                                    .cornerRadius(12)
                            }
                        }
                        
                        VStack {
                            HStack {
                                Text("Location")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            ZStack {
                                if location.isEmpty {
                                    HStack {
                                        Text("0").foregroundColor(.white.opacity(0.5))
                                        Spacer()
                                    }.padding(.horizontal, 12)
                                }
                                
                                TextField("", text: $location)
                                    .foregroundColor(.white)
                                    .padding(12).padding(.vertical, 5)
                                    .background(Color.white.opacity(0.3))
                                    .cornerRadius(12)
                            }
                        }
                        
                        VStack {
                            HStack {
                                Text("Wave height (Metrs)")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            ZStack {
                                if height.isEmpty {
                                    HStack {
                                        Text("0").foregroundColor(.white.opacity(0.5))
                                        Spacer()
                                    }.padding(.horizontal, 12)
                                }
                                
                                TextField("", text: $height)
                                    .foregroundColor(.white)
                                    .padding(12).padding(.vertical, 5)
                                    .background(Color.white.opacity(0.3))
                                    .cornerRadius(12)
                            }
                        }
                        
                        VStack {
                            HStack {
                                Text("Note")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            ZStack {
                                
                                
                                TextEditor(text: $note)
                                    .frame(height: UIScreen.main.bounds.height / 5.5)
                                    .foregroundColor(.black)
                                    .padding(12).padding(.vertical, 5)
                                    .background(Color.white.opacity(0.3))
                                    .cornerRadius(12)
                            }
                        }
                        
                        
                        
                    }.padding(.horizontal)
                }
                
                Button {
                    if !date.isEmpty && !location.isEmpty && !height.isEmpty && !note.isEmpty {
                       let contest = Contest(date: date, location: location, height: height, note: note)
                        viewModel.addContest(contest)
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    ZStack {
                        
                        Rectangle()
                            .frame(height: 52)
                            .foregroundColor(.primaryRed)
                            .cornerRadius(12)
                            .padding(.horizontal)
                            .opacity(!date.isEmpty && !location.isEmpty && !height.isEmpty && !note.isEmpty ? 1 : 0.3)
                        
                        
                        Text("Save")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.black)
                    }
                }
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    NewContestsUIView(viewModel: ContestsViewModel())
}
