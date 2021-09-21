//
//  SecondViewController.swift
//  GCD
//
//  Created by Oleg Kanatov on 21.09.21.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let indicator = UIActivityIndicatorView(style: .large)
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            indicator.startAnimating()
            indicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetup()
        imageViewSetup()
        indicatorSetup()
        fetchImage()
        
    }
    
    private func viewSetup() {
        view.backgroundColor = .white
    }
    
    private func imageViewSetup() {
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    fileprivate func fetchImage() {
        imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")
        indicator.isHidden = false
        indicator.startAnimating()
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
        self.image = UIImage(data: imageData)
    }
    
    private func indicatorSetup() {
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ])
    }
    
}
