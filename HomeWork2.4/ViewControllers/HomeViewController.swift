//
//  HomeViewController.swift
//  HomeWork2.4
//
//  Created by Alex Sander on 08.02.2020.
//  Copyright © 2020 Alex Sander. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IB Outlet
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    // MARK: - Properties
    
    var username: String!
    
    // MARK: - Life Cycles Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = "Welcome, \(username ?? "user")!"
    }
}
