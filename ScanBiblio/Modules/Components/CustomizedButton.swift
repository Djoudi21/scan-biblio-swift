import SwiftUI

struct CustomButton: View {
    var label: LocalizedStringKey // Change to LocalizedStringKey
    var action: () -> Void // Closure to hold the action
    var body: some View {
        Button(action: {
            action() // Call the action when the button is pressed
        }) {
            Text(label).frame(maxWidth: .infinity)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .padding()

    }
}

#Preview {
    CustomButton(label: "Press", action: {})
}
