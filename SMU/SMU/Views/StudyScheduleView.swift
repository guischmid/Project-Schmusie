import SwiftUI

struct StudyScheduleView: View {
    @StateObject private var viewModel = StudySessionViewModel()
    @State private var showingAddSessionView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.studySessions) { session in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(session.subject)
                                .font(.headline)
                            Text(session.date, style: .date)
                                .font(.subheadline)
                        }
                        Spacer()
                        Text("\(Int(session.duration / 60)) min")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Study Schedule")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        showingAddSessionView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddSessionView) {
                AddStudySessionView(viewModel: viewModel)
            }
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let session = viewModel.studySessions[index]
            viewModel.removeStudySession(id: session.id)
        }
    }
}

struct StudyScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        StudyScheduleView()
    }
}

