//
//  EditUIView.swift
//  app966
//
//  Created by Dias Atudinov on 21.10.2024.
//

import SwiftUI

enum EditHome {
    case result, goal, lift
}
struct EditUIView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State var editState: EditHome
    
    @State var resultHeight = ""
    @State var resulTime = ""
    @State var resultAvgSpeed = ""
    @State var goalHeight = ""
    @State var goalTime = ""
    @State var lifts = ""
    @State var goalLifts = ""
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                ZStack {
                    HStack {
                        if editState == .result {
                            Text("Best Result")
                                .font(.system(size: 17, weight: .semibold))
                        } else if editState == .goal {
                            Text("Goals")
                                .font(.system(size: 17, weight: .semibold))
                        } else {
                            Text("Lifts in a year")
                                .font(.system(size: 17, weight: .semibold))
                        }
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
                    
                    if editState == .result {
                        VStack(spacing: 16) {
                            VStack {
                                HStack {
                                    Text("Height (km)")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                ZStack {
                                    if resultHeight.isEmpty {
                                        HStack {
                                            Text("0").foregroundColor(.white.opacity(0.5))
                                            Spacer()
                                        }.padding(.horizontal, 12)
                                    }
                                    
                                    TextField("", text: $resultHeight)
                                        .keyboardType(.decimalPad)
                                        .foregroundColor(.white)
                                        .padding(12).padding(.vertical, 5)
                                        .background(Color.white.opacity(0.3))
                                        .cornerRadius(12)
                                }
                            }
                            
                            VStack {
                                HStack {
                                    Text("Time")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                ZStack {
                                    if resulTime.isEmpty {
                                        HStack {
                                            Text("0").foregroundColor(.white.opacity(0.5))
                                            Spacer()
                                        }.padding(.horizontal, 12)
                                    }
                                    
                                    TextField("", text: $resulTime)
                                        .foregroundColor(.white)
                                        .padding(12).padding(.vertical, 5)
                                        .background(Color.white.opacity(0.3))
                                        .cornerRadius(12)
                                }
                            }
                            
                            VStack {
                                HStack {
                                    Text("Average speed (km/h)")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                ZStack {
                                    if resultAvgSpeed.isEmpty {
                                        HStack {
                                            Text("0").foregroundColor(.white.opacity(0.5))
                                            Spacer()
                                        }.padding(.horizontal, 12)
                                    }
                                    
                                    TextField("", text: $resultAvgSpeed)
                                        .keyboardType(.decimalPad)
                                        .foregroundColor(.white)
                                        .padding(12).padding(.vertical, 5)
                                        .background(Color.white.opacity(0.3))
                                        .cornerRadius(12)
                                }
                            }
                            
                        }.padding(.horizontal)
                    } else if editState == .goal {
                        VStack(spacing: 16) {
                            
                            VStack {
                                HStack {
                                    Text("Time")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                ZStack {
                                    if goalTime.isEmpty {
                                        HStack {
                                            Text("0").foregroundColor(.white.opacity(0.5))
                                            Spacer()
                                        }.padding(.horizontal, 12)
                                    }
                                    
                                    TextField("", text: $goalTime)
                                        .foregroundColor(.white)
                                        .padding(12).padding(.vertical, 5)
                                        .background(Color.white.opacity(0.3))
                                        .cornerRadius(12)
                                }
                            }
                            
                            VStack {
                                HStack {
                                    Text("Height (km)")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                ZStack {
                                    if goalHeight.isEmpty {
                                        HStack {
                                            Text("0").foregroundColor(.white.opacity(0.5))
                                            Spacer()
                                        }.padding(.horizontal, 12)
                                    }
                                    
                                    TextField("", text: $goalHeight)
                                        .keyboardType(.decimalPad)
                                        .foregroundColor(.white)
                                        .padding(12).padding(.vertical, 5)
                                        .background(Color.white.opacity(0.3))
                                        .cornerRadius(12)
                                }
                            }
                        }.padding(.horizontal)
                    } else {
                        VStack(spacing: 16) {
                            
                            VStack {
                                HStack {
                                    Text("Lifts")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                ZStack {
                                    if lifts.isEmpty {
                                        HStack {
                                            Text("0").foregroundColor(.white.opacity(0.5))
                                            Spacer()
                                        }.padding(.horizontal, 12)
                                    }
                                    
                                    TextField("", text: $lifts)
                                        .keyboardType(.decimalPad)
                                        .foregroundColor(.white)
                                        .padding(12).padding(.vertical, 5)
                                        .background(Color.white.opacity(0.3))
                                        .cornerRadius(12)
                                }
                            }
                            
                            VStack {
                                HStack {
                                    Text("Goal")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                ZStack {
                                    if goalLifts.isEmpty {
                                        HStack {
                                            Text("0").foregroundColor(.white.opacity(0.5))
                                            Spacer()
                                        }.padding(.horizontal, 12)
                                    }
                                    
                                    TextField("", text: $goalLifts)
                                        .keyboardType(.decimalPad)
                                        .foregroundColor(.white)
                                        .padding(12).padding(.vertical, 5)
                                        .background(Color.white.opacity(0.3))
                                        .cornerRadius(12)
                                }
                            }
                        }.padding(.horizontal)
                    }
                }.padding(.top)
                
                Button {
                    if editState == .result {
                        if !resultHeight.isEmpty && !resulTime.isEmpty && !resultAvgSpeed.isEmpty {
                            viewModel.editResult(newHeight: resultHeight, newTime: resulTime, newSpeed: resultAvgSpeed)
                            presentationMode.wrappedValue.dismiss()
                        }
                    } else if editState == .goal {
                        if !goalTime.isEmpty && !goalHeight.isEmpty {
                            viewModel.editGoal(newHeight: goalHeight, newTime: goalTime)
                            presentationMode.wrappedValue.dismiss()
                        }
                    } else {
                        if let lifts = Double(lifts), let goalLifts = Double(goalLifts) {
                            viewModel.editLifts(newLifts: lifts, newGoalLifts: goalLifts)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                } label: {
                    ZStack {
                        if editState == .result {
                            Rectangle()
                                .frame(height: 52)
                                .foregroundColor(.primaryRed)
                                .cornerRadius(12)
                                .padding(.horizontal)
                                .opacity(!resultHeight.isEmpty && !resulTime.isEmpty && !resultAvgSpeed.isEmpty ? 1 : 0.3)
                        } else if editState == .goal {
                            Rectangle()
                                .frame(height: 52)
                                .foregroundColor(.primaryRed)
                                .cornerRadius(12)
                                .padding(.horizontal)
                                .opacity(!goalTime.isEmpty && !goalHeight.isEmpty ? 1 : 0.3)
                        } else {
                            Rectangle()
                                .frame(height: 52)
                                .foregroundColor(.primaryRed)
                                .cornerRadius(12)
                                .padding(.horizontal)
                                .opacity(!lifts.isEmpty && !goalLifts.isEmpty ? 1 : 0.3)
                        }
                        
                        Text("Save")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.black)
                    }
                }
            }
            .onAppear {
                
                resultHeight = viewModel.home.resultHeight
                resulTime = viewModel.home.resultTime
                resultAvgSpeed = viewModel.home.resultAvgSpeed
                goalHeight = viewModel.home.goalHeight
                goalTime = viewModel.home.goalTime
                lifts = "\(viewModel.home.lifts)"
                goalLifts = "\(viewModel.home.goalLifts)"
                
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    EditUIView(viewModel: HomeViewModel(), editState: .result)
}
