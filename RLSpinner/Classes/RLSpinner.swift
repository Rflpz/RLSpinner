import UIKit
import QuartzCore

public class RLSpinner: UIView {
    public static let shared = RLSpinner()
    private static var image: UIImage?
    
    public let configuration: RLSpinnerConfiguration = RLSpinnerConfiguration(backgroundColor: .green)
    
    private var imageViewSpinner = UIImageView()
    private let spinkey = "SpinnerRotation"
    private lazy var blurEffect = UIBlurEffect(style: .dark)
    lazy var blurEffectView = UIVisualEffectView(effect: blurEffect)

    // MARK: Public
    public class func configureSpinner(with image: UIImage) {
        self.image = image
    }
    
    private init() {
        guard RLSpinner.image?.imageAsset != nil else {
            fatalError("You must have to set an image to display in loader")
        }
        
        let mainScreenFrame  = UIScreen.main.bounds
        super.init(frame: mainScreenFrame)
        
        let centerX = (mainScreenFrame.width / 2) - (configuration.imageWidth / 2)
        let centerY = (mainScreenFrame.height / 2) - (configuration.imageHeight / 2)
        imageViewSpinner = UIImageView(frame: CGRect(x: centerX, y: centerY, width: configuration.imageWidth, height: configuration.imageWidth))
        imageViewSpinner.image = RLSpinner.image
        
        backgroundColor = .clear
        blurEffectView.frame = mainScreenFrame
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
        self.addSubview(imageViewSpinner)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func display(in view: UIView) {
        blurEffectView.alpha = 0
        imageViewSpinner.alpha = 0
        self.alpha = 1
        UIView.animate(withDuration: 0, animations: {
            if self.imageViewSpinner.layer.animation(forKey: self.spinkey) == nil {
                let spinAnimation = CABasicAnimation(keyPath: "transform.rotation")
                spinAnimation.fromValue = 0
                spinAnimation.toValue = Float.pi * 2
                spinAnimation.duration = 1
                spinAnimation.repeatCount = .infinity
                self.imageViewSpinner.layer.add(spinAnimation, forKey: self.spinkey)
            }
            view.addSubview(self)
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.blurEffectView.alpha = 1
            }, completion: { _  in
                UIView.animate(withDuration: 0.5, animations: {
                    self.imageViewSpinner.alpha = 1
                })

            })
        })
    }
    
    public func hide() {
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0
        }, completion: { _ in
            DispatchQueue.main.async {
                if self.imageViewSpinner.layer.animation(forKey: self.spinkey) != nil {
                    self.imageViewSpinner.layer.removeAnimation(forKey: self.spinkey)
                }
                self.removeFromSuperview()
            }
        })
    }
}
