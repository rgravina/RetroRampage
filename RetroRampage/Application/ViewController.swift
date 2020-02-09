import UIKit
import RetroRampageEngine

class ViewController: UIViewController {
    private var imageView: UIImageView
    private var player = Player(position: Vector(x: 4, y: 4))

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
        let displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.add(to: .main, forMode: .common)
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

    @objc func update(_ displayLink: CADisplayLink) {
        var renderer = Renderer(width: 8, height: 8)
        renderer.draw(player)
        imageView.image = UIImageFromBitmap.create(renderer.bitmap)!
    }
}
