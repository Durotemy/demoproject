//
//  ContentView.swift
//  demoproject
//
//  Created by Emmanuel Durotimi on 27/02/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .font(.system(size: 100))
                .foregroundStyle(.tint)
            Text("Hello, world here! hello").multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
 

