import SwiftUI

struct TintColor: Identifiable {
    let id: UUID = .init()
    var color: String
    var value: Color
}

var tints: [TintColor] = [
    .init(color: "Red", value: .red),
    .init(color: "Blue", value: .blue),
    .init(color: "Green", value: .green),
    .init(color: "Yellow", value: .yellow),
    .init(color: "Purple", value: .purple),
    .init(color: "Orange", value: .orange),
]

extension Color {
    static let appTint = Color.gray 
}
