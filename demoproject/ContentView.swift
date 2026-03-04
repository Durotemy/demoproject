import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State private var showProfile = false
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Image(systemName: "globe")
                    .font(.system(size: 100))
                    .foregroundStyle(.tint)
                
                Text("Hello, world here! hello here")
                    .multilineTextAlignment(.center)
                
                Button("Go to Profile") {
                    showProfile = true
                }
                
                Spacer()
                
                
                if let selectedImage {
                    selectedImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 250).cornerRadius(20)
                } else {
                    Image(systemName: "photo")
                        .font(.system(size: 100))
                        .foregroundStyle(.gray)
                }
                
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images
                ) {
                    Text("Select a Photo")
                }
                .onChange(of: selectedItem) { _, newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            selectedImage = Image(uiImage: uiImage)
                        }
                    }
                }
            }
            .padding()
            .navigationDestination(isPresented: $showProfile) {
                Profile()
            }
        }
    }
}

#Preview {
    ContentView()
}
