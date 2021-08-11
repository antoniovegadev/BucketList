//
//  ContentView.swift
//  BucketList
//
//  Created by Antonio Vega on 8/10/21.
//

import SwiftUI
import MapKit
import LocalAuthentication

enum AuthenticationState {
    case locked, unlocked
}

struct ContentView: View {
    @State private var isUnlocked = false
    @State private var authenticationState: AuthenticationState = .locked

    var body: some View {
        ZStack {
            switch authenticationState {
            case .unlocked:
                Places()
            case .locked:
                Button("Unlock Places") {
                    authenticate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself to unlock your places"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        authenticationState = .unlocked
                    } else {
                        // error
                    }
                }
            }
        } else {
              // no biometrics
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
