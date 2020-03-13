import UIKit
import RetroRampageEngine

private func loadMap() -> Tilemap {
    let jsonURL = Bundle.main.url(forResource: "Map", withExtension: "json")!
    let jsonData = try! Data(contentsOf: jsonURL)
    return try! JSONDecoder().decode(Tilemap.self, from: jsonData)
}

class ViewController: UIViewController {
    private var imageView: UIImageView
    private var panGesture: UIPanGestureRecognizer
    private var world = World(map: loadMap())
    private var lastFrameTime = CACurrentMediaTime()

    private var inputVector: Vector {
        switch panGesture.state {
        case .began, .changed:
            let translation = panGesture.translation(in: view)
            return Vector(x: Double(translation.x), y: Double(translation.y))
        default:
            return Vector(x: 0, y: 0)
        }
    }

    init() {
        imageView = UIImageView()
        panGesture = UIPanGestureRecognizer()
        super.init(nibName: nil, bundle: nil)
 
        setUpImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(panGesture)
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
        let timeStep = displayLink.timestamp - lastFrameTime
        let input = Input(velocity: inputVector)
        world.update(timeStep: timeStep, input: input)
        lastFrameTime = displayLink.timestamp

        let size = Int(min(imageView.bounds.width, imageView.bounds.height))
        var renderer = Renderer(width: size, height: size)
        renderer.draw(world)
        imageView.image = UIImageFromBitmap.create(renderer.bitmap)!
    }
}
