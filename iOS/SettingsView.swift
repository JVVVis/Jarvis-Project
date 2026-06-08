import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var apiKey = ""
    @State private var modelName = "gpt-4"
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.1, green: 0.1, blue: 0.2),
                        Color(red: 0.15, green: 0.15, blue: 0.25)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Form {
                        Section("API Settings") {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("API Key")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(.gray)
                                
                                SecureField("Enter your API key", text: $apiKey)
                                    .textFieldStyle(.roundedBorder)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Model")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(.gray)
                                
                                Picker("Model", selection: $modelName) {
                                    Text("GPT-4").tag("gpt-4")
                                    Text("GPT-3.5 Turbo").tag("gpt-3.5-turbo")
                                }
                                .pickerStyle(.segmented)
                            }
                        }
                        
                        Section("Voice Settings") {
                            VStack(alignment: .leading, spacing: 8) {
                                Toggle("Enable Voice Responses", isOn: .constant(true))
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: { dismiss() }) {
                        Text("Done")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.blue, Color(red: 0.0, green: 0.4, blue: 1.0)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
