//
//  ViewController.swift
//  Core Animation
//
//  Created by Tawsif - BCL Device 3 on 3/3/24.
//

import UIKit
import TheAnimation

class ViewController: UIViewController {
    
    let layer1 = CALayer()
    let layer2 = CALayer()
    let layer3 = CALayer()
    
    let view1 = UIView()

    let layer1Height: CGFloat = 150
    let layer2Height: CGFloat = 100
    let layer3Height: CGFloat = 50
    
    var transformScale = 1.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .gray
        view1.backgroundColor = .darkGray
//        view1.backgroundColor = .systemMint
//        view1.layer.cornerRadius = layer1Height/2
        view1.frame = CGRect(x: view.center.x-(layer1Height/2), y: view.center.y-(layer1Height/2), width: layer1Height, height: layer1Height)
        view.addSubview(view1)
        
        layer1.backgroundColor = UIColor.purple.withAlphaComponent(0.6).cgColor
        layer1.frame = CGRect(x: view.center.x-(layer1Height/2), y: view.center.y-(layer1Height/2), width: layer1Height, height: layer1Height)
        view.layer.addSublayer(layer1)
        
        layer2.backgroundColor = UIColor.yellow.withAlphaComponent(0.8).cgColor
//        layer2.cornerRadius = layer2Height/2
        layer2.frame = CGRect(x: view.center.x-(layer2Height/2), y: view.center.y-(layer2Height/2), width: layer2Height, height: layer2Height)
        view.layer.addSublayer(layer2)
        
        layer3.backgroundColor = UIColor.brown.cgColor
        layer3.frame = CGRect(x: view.center.x-(layer3Height/2), y: view.center.y-(layer3Height/2), width: layer3Height, height: layer3Height)
        view.layer.addSublayer(layer3)
        
        let button = UIButton(frame: CGRect(x: view.center.x-100, y: 100, width: 200, height: 50))
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        button.setTitle("Tap", for: .normal)
//        button.frame = CGRect(x: 50, y: 50, width: 200, height: 50)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
        
//        DispatchQueue.main.asyncAfter(deadline: .now()+3 ) {
//            self.animateMovement()
//            self.animateOpacity()
//            self.animateRotation()
//        }
    }
    
    @objc func buttonTapped() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
//            self.animateMovement()
//            self.animateOpacity()
//            self.animateRotation()

            
            UIView.animate(withDuration: 1) {
                self.scale()
            } completion: { done in
                if done {
                    UIView.animate(withDuration: 1) {
                        self.rollback()
//                        self.rotate()
//                        self.scale()
                    }
                }
            }

        }
    }
    
    private func animateMovement() {
        let animation = BasicAnimation(keyPath: .position)
        animation.fromValue = CGPoint(x: layer1.frame.origin.x + layer1.frame.size.width/2, y: layer1.frame.origin.y + layer1.frame.size.height/2)
//        animation.fromValue = CGPoint(x: , y: )
        animation.toValue = CGPoint(x: CGFloat.random(in: 0...view.frame.size.width-layer1.frame.size.width), y: CGFloat.random(in: 0...view.frame.size.height-layer1.frame.size.height))
        animation.duration = 4
//        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.timingFunction = .easeInEaseOut
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        
//        layer1.add(animation, forKey: nil)
        animation.animate(in: layer1)
        animation.animate(in: layer2)
        animation.animate(in: layer3)
//        layer2.cornerRadius = layer2Height/2
        
        
        view.layoutIfNeeded()

        
    }
    
    private func animateOpacity() {
        let animation = BasicAnimation(keyPath: .opacity)
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 4
//        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.timingFunction = .easeInEaseOut
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        
//        layer1.add(animation, forKey: nil)
        animation.animate(in: layer1)
//        animation.animate(in: layer2)
//        animation.animate(in: layer3)
        
    }
    
    private func animateRotation() {
        let animation = BasicAnimation(keyPath: .transformRotationZ)
        animation.fromValue = 0
        animation.toValue = .pi*12
        animation.duration = 4
//        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        animation.timingFunction = .easeInEaseOut
        animation.timingFunction = .linear
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        
//        layer1.add(animation, forKey: nil)
//        animation.animate(in: layer1)
//        animation.animate(in: layer2)
        animation.animate(in: layer3)
        
    }
    
    private func scale() {
//        view1.transform = CGAffineTransform(scaleX: transformScale, y: transformScale)
//        transformScale += 0.2
        view1.transform = CGAffineTransform(scaleX: 2, y: 2)
    }
    
    private func rotate() {
//        view1.transform = CGAffineTransform(scaleX: transformScale, y: transformScale)
//        transformScale += 0.2
        view1.transform = CGAffineTransform(rotationAngle: .pi / 2)
    }
    
    private func rollback() {
        view1.transform = .identity
    }


}

