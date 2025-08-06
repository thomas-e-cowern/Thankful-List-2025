//
//  NotificationListView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 8/6/25.
//
import SwiftUI
import UserNotifications



struct NotificationListView: View {
    @State private var pendingNotifications: [UNNotificationRequest] = []

    var body: some View {
        NavigationView {
            List {
                ForEach(pendingNotifications, id: \.identifier) { request in
                    VStack(alignment: .leading) {
                        Text(request.content.title)
                            .font(.headline)
                        Text(request.content.body)
                            .font(.subheadline)
                        if let trigger = request.trigger as? UNCalendarNotificationTrigger {
                            let weekdaySymbols = DateFormatter().weekdaySymbols
                            let day = trigger.dateComponents.weekday ?? 0
                            let hour = trigger.dateComponents.hour ?? 0
                            let minute = trigger.dateComponents.minute ?? 0
                            Text("Scheduled for \(weekdaySymbols?[day - 1] ?? "Unknown") at \(hour):\(minute)")
                        }
                    }
                }
            }
            .navigationTitle("Scheduled Notifications")
            .onAppear(perform: fetchPendingNotifications)
        }
    }

    private func fetchPendingNotifications() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            DispatchQueue.main.async {
                self.pendingNotifications = requests
            }
        }
    }
}
