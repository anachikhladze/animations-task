//
//  ViewController.swift
//  AnimationsMainTask
//
//  Created by Anna Sumire on 13.11.23.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - UI Components
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 51/255, green: 176/255, blue: 199/255, alpha: 1.0)
        label.font = UIFont(name: "Helvetica Bold", size: 22)
        label.layer.opacity = 0
        label.text = "TBC IT Academy"
        return label
    }()

    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        animateOnMainQueue()
    }
    
    // MARK: - Private Methods
    private func setup() {
        setupBackground()
        setupConstraints()
    }
    
    private func setupBackground() {
        view.backgroundColor = .white
    }
    
    private func setupConstraints() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func animateBounce() {
        let animation = CABasicAnimation(keyPath: "position")
        let originalY = titleLabel.layer.position.y
        animation.duration = 2
        animation.repeatCount = .infinity
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: titleLabel.center.x, y: originalY))
        animation.toValue = NSValue(cgPoint: CGPoint(x: titleLabel.center.x, y: originalY - 30))
        titleLabel.layer.add(animation, forKey: nil)
    }
    
    private func animateFade() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.toValue = 1
        animation.duration = 2
        animation.repeatCount = .infinity
        animation.autoreverses = true
        titleLabel.layer.add(animation, forKey: nil)
    }
    
    private func animateOnMainQueue() {
        DispatchQueue.main.async { [self] in
            animateBounce()
            animateFade()
        }
    }
}
