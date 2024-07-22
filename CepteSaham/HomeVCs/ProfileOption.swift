import Foundation

enum ProfileOption: CaseIterable {
    case history
    case personalDetails
    case location
    case paymentMethod
    case settings
    case help
    case logout
    
    var title: String {
        switch self {
        case .history: return "History"
        case .personalDetails: return "Personal Details"
        case .location: return "Location"
        case .paymentMethod: return "Payment Method"
        case .settings: return "Settings"
        case .help: return "Help"
        case .logout: return "Logout"
        }
    }
    
    var iconName: String {
        switch self {
        case .history: return "history-icon"
        case .personalDetails: return "history-icon"
        case .location: return "history-icon"
        case .paymentMethod: return "history-icon"
        case .settings: return "history-icon"
        case .help: return "history-icon"
        case .logout: return "history-icon"
        }
    }
}
