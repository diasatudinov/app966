//
//  CalendarUIView.swift
//  app966
//
//  Created by Dias Atudinov on 21.10.2024.
//

import SwiftUI

struct CalendarUIView: View {
    @ObservedObject var viewModel: CalendarViewModel
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .center,spacing: 0) {
                HStack {
                    Text("Calendar")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                    
                    NavigationLink {
                        NewCalendarUIView(viewModel: viewModel)
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.primaryRed)
                                .cornerRadius(15)
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }.padding(.horizontal)
                
                if viewModel.calendars.isEmpty {
                    Spacer()
                    VStack(spacing: 8) {
                        Text("Empty")
                            .font(.system(size: 28, weight: .bold))
                        Text("Nothing has been added to \nyour calendar yet")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 20, weight: .semibold))
                            .opacity(0.5)
                    }.foregroundColor(.white)
                    Spacer()
                    Spacer()
                } else {
                    ScrollView(showsIndicators: false) {
                        VStack {
                            ForEach(viewModel.calendars, id: \.self) { calendar in
                                CalendarCell(calendar: calendar, onDelete: {
                                    viewModel.deleteCalendar(calendar)
                                })
                                
                            }
                        }.padding(.horizontal).padding(.top, 20).padding(.bottom, 20)
                    }
                }
            }.padding(.top, 32)
        }.padding(.bottom, 20)
    }
}

#Preview {
    CalendarUIView(viewModel: CalendarViewModel())
}
