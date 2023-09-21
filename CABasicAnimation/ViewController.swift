//
//  ViewController.swift
//  CABasicAnimation
//
//  Created by DA MAC M1 157 on 2023/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var exampleView: UIView = {
        let view = UIView(frame: (CGRect(x: 1, y: view.center.y - 60, width: 120, height: 120)))
        view.backgroundColor = UIColor.orange

        return view
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: view.center.x - 70, y: view.frame.height - 80, width: 140, height: 50)
        button.setTitle("Start", for: .normal)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(startAnimating), for: .touchUpInside)
        button.layer.cornerRadius = 25
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        view.addSubview(exampleView)
        view.addSubview(startButton)
        
        print("Model Layer \(exampleView.layer.model())")
        print("presentation Layer \(exampleView.layer.presentation())")
    }

    @objc func startAnimating() {
        let basicAnimation = CABasicAnimation(keyPath: "position.x")
        basicAnimation.fromValue = exampleView.frame.width / 2
        basicAnimation.toValue = 250.0
        basicAnimation.duration = CFTimeInterval(1.0)
        
        exampleView.layer.position.x = 250

        basicAnimation.delegate = self
        exampleView.layer.add(basicAnimation, forKey:  nil)
    }

}


extension ViewController: CAAnimationDelegate {
    func animationDidStart(_ anim: CAAnimation) {
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        
        if flag {
            print("Model Layer \(exampleView.layer.model())")
            print("presentation Layer \(exampleView.layer.presentation())")
        }
    }
}
