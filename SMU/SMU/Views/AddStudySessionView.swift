import SwiftUI

struct AddStudySessionView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: StudySessionViewModel
    
    @State private var subject = ""
    @State private var date = Date()
    @State private var duration = 60.0 // duration in minutes
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Subject")) {
                    TextField("Enter subject", text: $subject)
                }
                Section(header: Text("Date and Time")) {
                    DatePicker("Select date and time", selection: $date, displayedComponents: [.date, .hourAndMinute])
                }
                Section(header: Text("Duration (minutes)")) {
                    Stepper(value: $duration, in: 15...180, step: 15) {
                        Text("\(Int(duration)) minutes")
                    }
                }
            }
            .navigationTitle("Add Study Session")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.addStudySession(subject: subject, date: date, duration: duration * 60)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct AddStudySessionView_Previews: PreviewProvider {
    static var previews: some View {
        AddStudySessionView(viewModel: StudySessionViewModel())
    }
}

