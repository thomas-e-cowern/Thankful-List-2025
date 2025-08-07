//
//  NotificationListViewNew.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 8/7/25.
//

import SwiftUI
import UserNotifications

// A simple model to represent a scheduled notification
struct NotificationItem: Identifiable {
    let id: String
    let request: UNNotificationRequest
    let dateComponents: DateComponents?
}

struct NotificationListViewNew: View {
    @State private var notifications: [NotificationItem] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notifications) { item in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.request.content.title)
                            .font(.headline)
                        
                        Text(item.request.content.body)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        if let _ = item.dateComponents {
                            Text("Scheduled for: \(formattedDate(from: item.dateComponents))")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 4)
                }
                .onDelete(perform: deleteNotification)
            }
            .navigationTitle("Scheduled Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: loadPendingNotifications)
            .overlay {
                if notifications.isEmpty {
                    ContentUnavailableView("You have no scheduled notifications yet.", systemImage: "clock.badge.checkmark", description: Text("When you add noifications to your list, they will appear here."))
                }
            }
        }
    }
    
    func loadPendingNotifications() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            let items = requests.map { request -> NotificationItem in
                var components: DateComponents? = nil
                if let trigger = request.trigger as? UNCalendarNotificationTrigger {
                    components = trigger.dateComponents
                }
                return NotificationItem(id: request.identifier, request: request, dateComponents: components)
            }
            DispatchQueue.main.async {
                self.notifications = items
            }
        }
    }
    
    func formattedDate(from components: DateComponents?) -> String {
        guard let components = components,
              let date = Calendar.current.date(from: components) else {
            return "Unknown date"
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE 'at' h:mm a" // Example: Monday at 9:30 AM
        return formatter.string(from: date)
    }

    
    func deleteNotification(at offsets: IndexSet) {
        for index in offsets {
            let notification = notifications[index]
            removeNotification(withIdentifier: notification.id)
        }
        notifications.remove(atOffsets: offsets)
    }
    
    func removeNotification(withIdentifier id: String) {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [id])
        center.removeDeliveredNotifications(withIdentifiers: [id])
    }
}

#Preview {
    NotificationListViewNew()
}
