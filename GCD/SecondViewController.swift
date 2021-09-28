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
        delay(3) {
            self.loginAlert()
        }
        
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
    
    private func indicatorSetup() {
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ])
    }
    
    fileprivate func delay(_ delay: Int, closure: @escaping () ->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
    
    fileprivate func loginAlert() {
        let ac = UIAlertController(title: "Registered?", message: "Enter your login and password", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        
        ac.addTextField { (usernameTF) in
            usernameTF.placeholder = "Enter your login"
        }
        ac.addTextField { (userPasswordTF) in
            userPasswordTF.placeholder = "Enter your password"
            userPasswordTF.isSecureTextEntry = true
        }
        
        self.present(ac, animated: true, completion: nil)
        
    }
    
    fileprivate func fetchImage() {
        imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")
        indicator.isHidden = false
        indicator.startAnimating()
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }
    }
    
    
    
}
