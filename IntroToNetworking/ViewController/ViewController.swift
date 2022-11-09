//
//  ViewController.swift
//  IntroToNetworking
//
//  Created by Consultant on 11/9/22.
//

import UIKit

class ViewController: UIViewController {
    
 
    var stockLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Image Randomizer!!!"
        label.textColor = .systemPurple
        return label
    }()
    lazy var stockImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemPurple
        imageView.layer.cornerRadius = 20.0
        return imageView
        
    }()
    
    lazy var stockButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Image", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.layer.cornerRadius = 20.0
        //        register
        button.addTarget(self, action: #selector(self.stockButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    let network = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.createUI()
        
    }
    
    func createUI() {
        self.view.addSubview(self.stockImageView)
        self.view.addSubview(self.stockButton)
        self.view.addSubview(self.stockLabel)
        
        self.stockImageView.topAnchor.constraint(equalTo: self.stockLabel.bottomAnchor, constant: 8).isActive = true
        self.stockImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.stockImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        self.stockButton.topAnchor.constraint(equalTo: self.stockImageView.bottomAnchor, constant: 8).isActive = true
        self.stockButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.stockButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.stockButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        self.stockLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 8).isActive = true
        self.stockLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 8).isActive = true
        self.stockLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -8).isActive = true
        self.stockLabel.bottomAnchor.constraint(equalTo: stockImageView.topAnchor, constant: -8).isActive = true
    }
    
        
        
    

    @objc
    func stockButtonPressed(_ sender: UIButton) {
        print("Button Pressed")
        
        let frame = self.stockImageView.frame
        
        self.network.fetchImageData(path: "https://picsum.photos/\(Int(frame.width))/\(Int(frame.height))") { [weak self] data in
            guard let data = data else { return }
            print(data)
            DispatchQueue.main.async {
                self?.stockImageView.image = UIImage(data: data)
            }
            
            
        }
    }
    
    
}
