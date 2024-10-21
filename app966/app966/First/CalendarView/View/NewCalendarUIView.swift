//
//  NewCalendarUIView.swift
//  app966
//
//  Created by Dias Atudinov on 21.10.2024.
//

import SwiftUI

struct NewCalendarUIView: View {
    @ObservedObject var viewModel: CalendarViewModel
    @State var date = ""
    @State var location = ""
    @State var height = ""
    @State var equipName = ""
    @State var selectedEquips: [String] = []
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
                                Text("Equipment")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            ZStack {
                                if equipName.isEmpty {
                                    HStack {
                                        Text("Enter").foregroundColor(.white.opacity(0.5))
                                            .allowsHitTesting(false)
                                        Spacer()
                                    }.padding(.horizontal, 12)
                                }
                                
                                HStack {
                                    TextField("", text: $equipName)
                                        .foregroundColor(.white)
                                        .padding(12).padding(.vertical, 5)
                                        .background(Color.white.opacity(0.3))
                                        .cornerRadius(12)
                                    
                                    Button {
                                        if !equipName.isEmpty {
                                            addEquips(equipName)
                                            equipName = ""
                                        }
                                    } label: {
                                        ZStack {
                                            Circle()
                                                .frame(height: 34)
                                                .foregroundColor(.primaryRed)
                                            Image(systemName: "plus")
                                                .foregroundColor(.black)
                                        }
                                    }
                                }
                            }.padding(.bottom, 8)
                            
                            VStack(spacing: 8) {
                                ForEach(selectedEquips, id: \.self) { equips in
                                   
                                    if !selectedEquips.isEmpty {
                                        HStack {
                                            HStack {
                                                Text(equips)
                                                    .multilineTextAlignment(.leading)
                                                    .foregroundColor(.white)
                                                    
                                                Spacer()
                                            }.frame(maxWidth: .infinity)
                                                .padding(12).padding(.vertical, 5)
                                                .background(Color.white.opacity(0.3))
                                                .cornerRadius(12)
                                            
                                            Button {
                                                deleteEquips(equips)
                                            } label: {
                                                ZStack {
                                                    Circle()
                                                        .frame(height: 34)
                                                        .foregroundColor(.white.opacity(0.3))
                                                    Image(systemName: "trash.fill")
                                                        .foregroundColor(.primaryRed)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        
                        
                    }.padding(.horizontal)
                }
                
                Button {
                    if !date.isEmpty && !location.isEmpty && !height.isEmpty && !selectedEquips.isEmpty {
                       let calendar = Calendar(date: date, location: location, height: height, equipments: selectedEquips)
                        viewModel.addCalendar(calendar)
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    ZStack {
                        
                        Rectangle()
                            .frame(height: 52)
                            .foregroundColor(.primaryRed)
                            .cornerRadius(12)
                            .padding(.horizontal)
                            .opacity(!date.isEmpty && !location.isEmpty && !height.isEmpty && !selectedEquips.isEmpty ? 1 : 0.3)
                        
                        
                        Text("Save")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.black)
                    }
                }
            }
        }.navigationBarBackButtonHidden()
    }
    
    private func addEquips(_ equipName: String) {
        selectedEquips.append(equipName)
    }
    
    private func deleteEquips(_ equipName: String) {
        if let index = selectedEquips.firstIndex(where: { $0 == equipName }) {
            selectedEquips.remove(at: index)
        }
    }
}

#Preview {
    NewCalendarUIView(viewModel: CalendarViewModel())
}
