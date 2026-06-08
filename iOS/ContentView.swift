import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var showVoiceOptions = false
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.1, blue: 0.2),
                    Color(red: 0.15, green: 0.15, blue: 0.25)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HeaderView(viewModel: viewModel)
                
                // Messages List
                MessagesView(messages: viewModel.messages)
                
                // Error Message
                if let errorMessage = viewModel.errorMessage {
                    ErrorBannerView(message: errorMessage)
                }
                
                // Input Area
                InputAreaView(
                    viewModel: viewModel,
                    showVoiceOptions: $showVoiceOptions
                )
            }
        }
        .onAppear {
            viewModel.loadHistory()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
