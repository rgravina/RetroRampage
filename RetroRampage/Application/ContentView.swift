import SwiftUI

struct ContentView: View {
    let image = UIImage()

    var body: some View {
        return Image(uiImage: image)
            .background(SwiftUI.Color.black)
            .aspectRatio(contentMode: .fit)
    }
}
