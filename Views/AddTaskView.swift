import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: TaskViewModel

    @State private var title = ""
    @State private var description = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Task", text: $title)
                TextField("Description", text: $description)

                Button("Add") {
                    viewModel.addTask(title: title, description: description)
                    dismiss()
                }
                .frame(maxWidth: .infinity)
            }
            .navigationTitle("Add New")
        }
    }
}

