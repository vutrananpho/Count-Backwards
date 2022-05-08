//
//  ContentView.swift
//  "Count Backwards" on Xcode utilizing UI Kit
//  App structure: Count down from 10 -> 0
//  Start (pink): start counting down
//  Reset (orange): go back to the original start (10)
//
//  Created by @Pho Vu on 5/7/22.
//  Inspired by YT Channel "Code Palace".
//
//

import SwiftUI // import Swift user interface framework

struct ContentView: View {
    @State var countDownTimer = 10 // starting point
    @State var timerRunning = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack {
            Text("\(countDownTimer)")
                .onReceive(timer) { _ in
                    if countDownTimer > 0 && timerRunning {
                        countDownTimer -= 1
                    } else {
                        timerRunning = false
                    }
                }
                .font(.system(size: 80, weight: .bold))
                .opacity (0.80)
            
            
            HStack(spacing: 100) { // distance between 2 buttons "Start" & "Reset"
                Button("Hit Start!") { // name the activation button
                    timerRunning = true
                } . foregroundColor(.pink) // set the color to pink
                Button("Reset?") { //name the restart button
                    countDownTimer = 10
                } .foregroundColor(.orange) // set the color to orange
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
