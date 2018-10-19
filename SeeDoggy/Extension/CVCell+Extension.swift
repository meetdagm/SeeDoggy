//
//  CVCell+Extension.swift
//  SeeDoggy
//
//  Created by Dagmawi Nadew-Assefa on 10/17/18.
//  Copyright © 2018 Sason. All rights reserved.
//


import UIKit


protocol ReusableView: class { }

extension ReusableView where Self: UIView {
    static var reusableIdentifer: String {
        return String(describing: self)
    }
}

protocol TapticScrollable: class { }

extension TapticScrollable where Self: UIView {
    func makeTapticFeedback() {
        UIImpactFeedbackGenerator().impactOccurred()
    }
}

protocol Shadowable: class { }

extension Shadowable where Self: UIView {
    func addShadow(){
        
        layer.shadowColor = kAppDarkGrayColor.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 5.0
        
    }
}


protocol Tappable: class { }

extension Tappable where Self: UIView {
    func animateTap(with tapticImpact: Bool = true) {
        let impact = UIImpactFeedbackGenerator()
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.3
        pulse.fromValue = 1.0
        pulse.toValue = 0.97
        pulse.autoreverses = false
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        pulse.stiffness = 500.0
        if tapticImpact {
            impact.impactOccurred()
        }
        layer.add(pulse, forKey: nil)
    }
}
