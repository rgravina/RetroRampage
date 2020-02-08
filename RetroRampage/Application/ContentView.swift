import SwiftUI
import RetroRampageEngine

struct ContentView: View {
    let image: UIImage

    init() {
        var bitmap = Bitmap(width: 8, height: 8, color: .white)
        bitmap[0, 0] = .blue
        image = UIImageFromBitmap.create(bitmap)!
    }

    var body: some View {
        return ZStack {
            Image(uiImage: image)
                .resizable()
                .interpolation(.none)
                .scaledToFit()
        }
    }
}
