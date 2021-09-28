//
//  ViewController.swift
//  GCD
//
//  Created by Oleg Kanatov on 21.09.21.
//

import UIKit

class ViewController: UIViewController {
    
    private let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetup()
        buttonSetup()
    }
    
    private func viewSetup() {
        
        view.backgroundColor = .white
        
    }
    
    private func buttonSetup() {
        button.setTitle("Go to 2VC", for: .normal)
        button.backgroundColor = .brown
        button.tintColor = .white
        button.addTarget(self, action: #selector(goTo2VC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    @objc func goTo2VC(sender: UIButton) {
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
}

