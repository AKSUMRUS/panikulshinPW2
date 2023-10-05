import UIKit

final class WishMakerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    enum Constants {
        static let sliderMin: Double = 0
        static let sliderMax: Double = 1
        
        static let red: String = "Red"
        static let blue: String = "Blue"
        static let green: String = "Green"
        
        static let stackRadius: CGFloat = 20
        static let stackBottom: CGFloat = -40
        static let stackLeading: CGFloat = 20
    }
    
    private var backgroundRed: CGFloat = 0
    private var backgroundGreen: CGFloat = 0
    private var backgroundBlue: CGFloat = 0
    
    private func configureUI() {
        view.backgroundColor = .black
        
        configureTitle()
        configureDescription()
        configureSliders()
    }
    
    private func configureTitle() {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "WishMaker"
        title.font = UIFont.boldSystemFont(ofSize: 32)
        title.textColor = .darkGray
        
        view.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
    
    private func configureDescription() {
        let title = view.subviews.first
        
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = "WishMaker description"
        description.font = UIFont.boldSystemFont(ofSize: 18)
        description.textColor = .darkGray
        
        view.addSubview(description)
        
        NSLayoutConstraint.activate([
            description.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            description.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            description.topAnchor.constraint(equalTo: title!.bottomAnchor, constant: 20)
        ])
    }
    
    private func configureSliders() {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = Constants.stackRadius
        stack.clipsToBounds = true
        
        let redSlider = CustomSlider(title: Constants.red, min: Constants.sliderMin, max: Constants.sliderMax)
        let bludeSlider = CustomSlider(title: Constants.blue, min: Constants.sliderMin, max: Constants.sliderMax)
        let greenSlider = CustomSlider(title: Constants.green, min: Constants.sliderMin, max: Constants.sliderMax)
        
        for slider in [redSlider, bludeSlider, greenSlider] {
            stack.addArrangedSubview(slider)
        }
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.stackLeading),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.stackBottom)
        ])
        
        redSlider.valueChanged = { [weak self] value in
            self?.backgroundRed = value
            self?.changeBackground()
        }
        greenSlider.valueChanged = { [weak self] value in
            self?.backgroundGreen = value
            self?.changeBackground()
        }
        bludeSlider.valueChanged = { [weak self] value in
            self?.backgroundBlue = value
            self?.changeBackground()
        }
    }
    
    private func changeBackground() {
        view.backgroundColor = UIColor(red: backgroundRed, green: backgroundGreen, blue: backgroundBlue, alpha: 1)
    }
}
