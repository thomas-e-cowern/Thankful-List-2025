//
//  NotificationSchedulerView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 8/6/25.
//

import SwiftUI
import UserNotifications

struct NotificationSchedulerView: View {
    @State private var selectedTime = Date()
    @State private var selectedDays: Set<String> = []
    
    let daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select Time")) {
                    DatePicker("Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                }

                Section(header: Text("Select Days")) {
                    ForEach(daysOfWeek, id: \.self) { day in
                        Button(action: {
                            toggleDay(day)
                        }) {
                            HStack {
                                Text(day)
                                Spacer()
                                if selectedDays.contains(day) {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                        .foregroundColor(.primary)
                    }
                }

                Section {
                    Button("Schedule Notifications") {
                        requestNotificationPermission()
                        scheduleNotifications()
                    }
                }
            }
            .navigationTitle("Reminder Scheduler")
        }
    }

    // Toggle selected day
    func toggleDay(_ day: String) {
        if selectedDays.contains(day) {
            selectedDays.remove(day)
        } else {
            selectedDays.insert(day)
        }
    }

    // Ask for notification permission
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Permission error: \(error)")
            }
        }
    }

    // Schedule notification
    func scheduleNotifications() {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: selectedTime)
        let minute = calendar.component(.minute, from: selectedTime)

        for day in selectedDays {
            guard let weekday = daysOfWeek.firstIndex(of: day)?.advanced(by: 1) else { continue }

            var dateComponents = DateComponents()
            dateComponents.weekday = weekday // 1 = Sunday, 7 = Saturday
            dateComponents.hour = hour
            dateComponents.minute = minute

            let content = UNMutableNotificationContent()
            content.title = "from your Thankful list"
            content.body = "Isn't there something your thankful for?"
            content.sound = .default

            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let identifier = "\(day)-\(hour)-\(minute)"
            let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Scheduling error: \(error)")
                }
            }
        }
    }
}

#Preview {
    NotificationSchedulerView()
}
