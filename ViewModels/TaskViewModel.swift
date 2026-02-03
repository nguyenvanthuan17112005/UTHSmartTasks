import Foundation
import SwiftUI
import Combine
class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []

    private let saveKey = "tasks_key"

    init() {
        loadTasks()
    }

    func addTask(title: String, description: String) {
        let colors = ["#CDE7FF", "#F6C6CC", "#E7EFC5"]
        let randomColor = colors.randomElement() ?? "#CDE7FF"

        let newTask = Task(
            title: title,
            description: description,
            colorHex: randomColor
        )

        tasks.append(newTask)
        saveTasks()
    }

    private func saveTasks() {
        if let data = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }

    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let savedTasks = try? JSONDecoder().decode([Task].self, from: data) {
            tasks = savedTasks
        }
    }
}

