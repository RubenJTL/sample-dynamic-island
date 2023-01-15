//
//  TimeTrackingView.swift
//  sample-dynamic-island
//
//  Created by Ruben Torres on 15/01/23.
//

import SwiftUI
import ActivityKit

struct TimeTrackingView: View {
    @State private var isTrackingTime = false
    @State private var startTime: Date?
    @State private var activity: Activity<TimeTrackingAttributes>?
    
    var body: some View {
        VStack {
            if let startTime {
                Text(startTime, style: .relative)
                    .font(.title)
            }
            
            Button {
                isTrackingTime.toggle()
                
                if isTrackingTime {
                    startTime = .now
                    
                    // Start live activity
                    let activityAttributes = TimeTrackingAttributes()
                    let initialContentState = TimeTrackingAttributes.ContentState(startTime: .now)
                    let activityContent = ActivityContent(state: initialContentState, staleDate: nil)

                    activity = try? Activity<TimeTrackingAttributes>.request(attributes: activityAttributes, content: activityContent)
                    
                    // ContentState is deprecated in 16.2
                    //                    try? Activity<TimeTrackingAttributes>.request(attributes: attribute, contentState: state)
                } else {
                    // End live activity
                    guard let startTime
                    else { return }
                    
                    let state = TimeTrackingAttributes.ContentState(startTime: startTime)
                    let activityContent = ActivityContent(state: state, staleDate: nil)
                    
                    Task {
                        await activity?.end(activityContent, dismissalPolicy: .immediate)
                    }
                    
                    self.startTime = nil
                }
            } label: {
                Image(systemName: isTrackingTime ? "stop.fill" : "play.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                    .frame(width: 200, height: 200)
                    .background(
                        Circle()
                        .fill(isTrackingTime ? .red : .green)
                    )
            }
        }
        .navigationTitle("Time tracker")
    }
}

struct TimeTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTrackingView()
    }
}
