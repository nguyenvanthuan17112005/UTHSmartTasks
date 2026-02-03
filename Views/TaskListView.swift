import SwiftUI

struct TaskListView: View {
    @StateObject var viewModel = TaskViewModel()
    @State private var showAddTask = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(viewModel.tasks) { task in
                        TaskRowView(task: task)
                    }
                }
                .padding()
            }
            .navigationTitle("List")
            .toolbar {
                Button {
                    showAddTask = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                }
            }
            .sheet(isPresented: $showAddTask) {
                AddTaskView(viewModel: viewModel)
            }
        }
    }
}

