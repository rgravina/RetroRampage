import UIKit
import RetroRampageEngine

class RendererViewController: UIViewController {
    var imageView: UIImageView

    init() {
        imageView = UIImageView()
        super.init(nibName: nil, bundle: nil)
 
        setUpImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var renderer = Renderer(width: 8, height: 8)
        renderer.draw()
        imageView.image = UIImageFromBitmap.create(renderer.bitmap)!
    }
    
    func setUpImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.layer.magnificationFilter = .nearest
    }
}
