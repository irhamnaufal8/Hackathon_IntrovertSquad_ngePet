//
//  TransaksiSukses.swift
//  ngePet
//
//  Created by Garry on 29/05/22.
//

import SwiftUI

struct TransaksiSukses: View {
    @Binding var flag: Bool
    let showTime: Double
    var text: String
    var body: some View {
        VStack {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 60))
                .foregroundColor(.white)
            
            Text(text)
                .font(Font.custom("RoundedMplus1c-Medium", size: 15))
                .foregroundColor(.white)
                .onAppear {
                    withAnimation {
                        let _delay = RunLoop.SchedulerTimeType(.init(timeIntervalSinceNow: self.showTime))
                        RunLoop.main.schedule(after: _delay) {
                            self.flag.toggle()
                        }
                    }
                }
        }
        .padding()
        .padding(.vertical)
        .background(Color("Green"))
        .cornerRadius(18)
        .frame(maxWidth: 200)
    }
}
