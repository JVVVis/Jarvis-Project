import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding = false
    @State private var currentPage = 0
    
    var body: some View {
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
            
            VStack(spacing: 0) {
                TabView(selection: $currentPage) {
                    // Page 1: Welcome
                    VStack(spacing: 30) {
                        Spacer()
                        
                        Image(systemName: "sparkles")
                            .font(.system(size: 80))
                            .foregroundColor(.blue)
                        
                        VStack(spacing: 12) {
                            Text("Welcome to Jvis")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text("Your personal AI assistant")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.gray)
                        }
                        .multilineTextAlignment(.center)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .tag(0)
                    
                    // Page 2: Features
                    VStack(spacing: 24) {
                        Spacer()
                        
                        FeatureRow(
                            icon: "mic.fill",
                            title: "Voice Support",
                            description: "Talk naturally - Jvis understands and responds with voice"
                        )
                        
                        FeatureRow(
                            icon: "clock.fill",
                            title: "24/7 Available",
                            description: "Get help anytime, anywhere you need it"
                        )
                        
                        FeatureRow(
                            icon: "brain.head.profile",
                            title: "Smart AI",
                            description: "Powered by advanced AI to give you thoughtful answers"
                        )
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .tag(1)
                    
                    // Page 3: Setup
                    VStack(spacing: 24) {
                        Spacer()
                        
                        VStack(spacing: 12) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.green)
                            
                            Text("You're All Set!")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text("Start chatting with Jvis to get help with your daily challenges")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                
                VStack(spacing: 12) {
                    if currentPage < 2 {
                        Button(action: { 
                            withAnimation {
                                currentPage += 1
                            }
                        }) {
                            Text("Next")
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
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
                    } else {
                        Button(action: {
                            hasCompletedOnboarding = true
                        }) {
                            Text("Get Started")
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.green, Color(red: 0.0, green: 0.7, blue: 0.4)]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    
                    if currentPage > 0 {
                        Button(action: {
                            withAnimation {
                                currentPage -= 1
                            }
                        }) {
                            Text("Back")
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 24)
            }
        }
    }
}

struct FeatureRow: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(.blue)
                .frame(width: 50, height: 50)
                .background(Color(red: 0.2, green: 0.2, blue: 0.3))
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                
                Text(description)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            
            Spacer()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
