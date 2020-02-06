import SwiftUI

struct ContentView: View {
    let image = UIImage()

    var body: some View {
        Image(uiImage: image)
            .background(Color.black)
            .aspectRatio(contentMode: .fit)
    }
}
