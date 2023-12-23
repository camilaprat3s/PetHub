import SwiftUI

struct HomeView: View {
    let services = [
        ("Vet", "🩺"),
        ("Bath / Grooming", "🛁"),
        ("Pet Sitter", "🤗"),
        ("Hotel", "🏨")
    ]

    @State private var selectedService = "Vet"

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    Spacer() // Add Spacer at the beginning

                    ForEach(services, id: \.0) { service, emoji in
                        Button(action: {
                            selectedService = service
                        }) {
                            CardView(service: service, emoji: emoji, isSelected: selectedService == service)
                                .frame(width: 80, height: 60)
                        }
                        .background(Color.clear)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.clear, lineWidth: 1)
                                .shadow(color: selectedService == service ? Color.black.opacity(0.2) : Color.clear, radius: 2, x: 0, y: 1)
                        )
                    }

                    Spacer() // Add Spacer at the end
                }
                .padding(.horizontal, 10)
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor.systemGray6))
                    .frame(height: 80)
            )
            .padding(.top, 5)

            Text("Selected service: \(selectedService)")
                .padding(.top, 10) // Add gap above the text
                .padding(.bottom, 10) // Add gap under the text

            Spacer() // Add Spacer
        }
        .padding(.bottom, 10)
    }
}

struct CardView: View {
    let service: String
    let emoji: String
    let isSelected: Bool

    var body: some View {
        VStack(spacing: 5) {
            ZStack {
                Circle()
                    .fill(isSelected ? Color.white : Color.clear)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text(emoji)
                            .font(.title)
                            .foregroundColor(isSelected ? .black : .white)
                            .opacity(isSelected ? 1.0 : 0.8)
                    )
            }
            Text(service)
                .font(.caption)
                .foregroundColor(.black)
                .lineLimit(1)
                .multilineTextAlignment(.center)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 5)
                .padding(.bottom, 5)
        }
        .frame(width: 80, height: 60)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(isSelected ? Color.white : Color.clear)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.clear, lineWidth: 1)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

